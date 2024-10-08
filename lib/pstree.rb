require 'pstree/version'

class PSTree
  class ProcStruct
    def initialize(ppid, pid, user, cmd)
      @ppid, @pid, @user, @cmd = ppid.to_i, pid.to_i, user, cmd
    end

    attr_reader :ppid, :pid, :user, :cmd

    def to_s
     "%05u %s (%s)" % [ pid, cmd, user ]
    end
  end

  include Enumerable

  def initialize(root_pid = nil, charset: 'UTF-8')
    @charset  = charset.to_s.upcase
    @root_pid = root_pid.to_i
  end

  def children_zero(last)
    if @charset == 'UTF-8'
      last ? '└─ ' : '   '
    else
      last ? '`- ' : '   '
    end
  end

  def children_not_zero(last)
    if @charset == 'UTF-8'
      last ? '├─ ' : '│  '
    else
      last ? '+- ' : '|  '
    end
  end

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

  def each(&block)
    build
    recurse @root_pid, &block
    self
  end

  private

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
