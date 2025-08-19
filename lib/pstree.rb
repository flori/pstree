require 'pstree/version'

# PSTree is a process status tree implementation that creates and displays
# hierarchical process information.
#
# This class provides functionality to build and visualize process trees
# starting from a specified root process ID. It encapsulates process data
# including parent process ID, process ID, user, and command line, and formats
# this information into a readable tree structure with proper indentation and
# branch characters.
#
# @example Creating and displaying a process tree
#   tree = PSTree.new($$)
#   puts tree.to_s
#
# @example Iterating over processes in the tree
#   tree = PSTree.new($$)
#   tree.each do |process|
#     puts process.pid
#   end
class PSTree
  # Process structure for storing and formatting process information.
  #
  # This class encapsulates the essential details of a process including its
  # parent process ID, process ID, owning user, and command line.
  #
  # @example Creating a new process structure
  #   proc = PSTree::ProcStruct.new(1234, 5678, 'flori', '/usr/bin/ruby script.rb')
  class ProcStruct
    # Initializes a new process structure with the given process information.
    #
    # @param ppid [ String, Integer ] the parent process ID
    # @param pid [ String, Integer ] the process ID
    # @param user [ String ] the user who owns the process
    # @param cmd [ String ] the command line of the process
    def initialize(ppid, pid, user, cmd)
      @ppid, @pid, @user, @cmd = ppid.to_i, pid.to_i, user, cmd
    end

    # The ppid reader method returns the parent process ID of this process
    # structure.
    #
    # @attr_reader [ Integer ] the parent process identifier
    attr_reader :ppid

    # The pid reader method returns the process ID of this process structure.
    #
    # @attr_reader [ Integer ] the process identifier
    attr_reader :pid

    # The user reader method returns the username who owns this process
    #
    # @attr_reader [ String ] the user identifier who owns the process
    attr_reader :user

    # The cmd reader method returns the command line of this process structure.
    #
    # @attr_reader [ String ] the command line associated with the process
    attr_reader :cmd

    # The to_s method formats the process information into a string representation
    # that displays the process ID, command, and user in a standardized format.
    #
    # @return [ String ] a formatted string containing the process ID, command,
    #                    and user separated by spaces and parentheses
    def to_s
     "%05u %s (%s)" % [ pid, cmd, user ]
    end
  end

  include Enumerable

  # Initializes a new PSTree instance with the specified root process ID and character set.
  #
  # @param root_pid [ String, Integer, nil ] the process ID of the root process
  # to start the tree from
  # @param charset [ String ] the character encoding to use for display
  # formatting
  def initialize(root_pid = nil, charset: 'UTF-8')
    @charset  = charset.to_s.upcase
    @root_pid = root_pid.to_i
  end

  # Returns the appropriate tree drawing character sequence for a process with
  # zero children, based on the current charset setting.
  #
  # @param last [ TrueClass, FalseClass ] whether this is the last child in a
  #                                       sequence
  #
  # @return [ String ] the character sequence to use for drawing the tree branch
  #                    line, either UTF-8 or ASCII characters depending on charset
  #                    configuration
  def children_zero(last)
    if @charset == 'UTF-8'
      last ? '└─ ' : '   '
    else
      last ? '`- ' : '   '
    end
  end

  # Returns the appropriate tree drawing character sequence for a process with
  # children, based on the current charset setting and whether the process is
  # the last child in a sequence.
  #
  # @param last [ TrueClass, FalseClass ] whether this is the last child in a sequence
  #
  # @return [ String ] the character sequence to use for drawing the tree
  #                    branch line, either UTF-8 or ASCII characters depending
  #                    on charset configuration
  def children_not_zero(last)
    if @charset == 'UTF-8'
      last ? '├─ ' : '│  '
    else
      last ? '+- ' : '|  '
    end
  end

  # The to_s method generates a string representation of the process tree
  # starting from the root process ID. It builds the tree structure and formats
  # each process entry with appropriate tree-drawing characters based on the
  # process hierarchy and charset configuration. The resulting string includes
  # process IDs, commands, and users in a hierarchical display format.
  #
  # @return [ String ] a formatted string representation of the process tree
  #                    with proper indentation and tree-drawing characters
  def to_s
    build
    result = ''
    recurse @root_pid,
      -> children, last {
        if children.zero?
          result << children_zero(last)
        else
          result << children_not_zero(last)
        end
      } do |ps|
      result << ps.to_s << "\n"
    end
    result
  end

  # The each method iterates over all processes in the process tree by
  # executing the given block for each process.
  #
  # @yield [ ps ]
  #
  # @return [ PSTree ] returns itself to allow for method chaining
  def each(&block)
    build
    recurse @root_pid, &block
    self
  end

  private

  # The build method constructs the internal process tree data structure by
  # parsing output from the ps command.
  #
  # It initializes the necessary instance variables and populates them with
  # process information obtained from executing the /bin/ps command with
  # specific output format options. The method processes each line of the ps
  # output to create ProcStruct objects and organizes them into a hierarchical
  # tree structure based on parent process IDs.
  def build
    @child_count = [ 0 ]
    @process = {}
    @pstree = Hash.new { |h,k| h[k] = [] }
    psoutput = `/bin/ps axww -o ppid,pid,user,command`
    psoutput.each_line do |line|
      next if line !~ /^\s*\d+/
      line.strip!
      ps = ProcStruct.new(*line.split(/\s+/, 4))
      @process[ps.pid] = ps
      @pstree[ps.ppid] << ps
    end
  end

  # The recurse method performs a recursive traversal of the process tree
  # starting from a given process ID.
  #
  # It processes each node in the tree by executing the provided callback for
  # the current process, then recursively processes all child processes. The
  # method handles tree drawing character generation based on the hierarchy
  # level and whether a process has children.
  #
  # @param pid [ Integer ] the process ID to start recursion from
  # @param shift_callback [ Proc, nil ] optional callback to generate tree drawing characters
  # @param level [ Integer ] current depth level in the tree hierarchy
  # @param in_root [ TrueClass, FalseClass ] flag indicating if current node is the root
  #
  # @yield [ ps ]
  def recurse(pid, shift_callback = nil, level = 0, in_root = false, &node_callback)
    in_root = in_root || @root_pid == 0 || @root_pid == pid
    @child_count[level] = @pstree[pid].size
    for l in 0...level
      shift_callback and shift_callback.call(@child_count[l], l == level - 1)
    end
    node_callback and process = @process[pid] and node_callback.call(process)
    if @pstree.key?(pid)
      @child_count[level] = @pstree[pid].size - 1
      @pstree[pid].each do |ps|
        recurse(ps.pid, shift_callback, level + 1, in_root, &node_callback)
        @child_count[level] -= 1
      end
    end
    @pstree.delete pid
  end
end
