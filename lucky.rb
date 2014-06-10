# In some countries of former Soviet Union there was
# a belief about lucky tickets. A transport ticket
# of any sort was believed to posess luck if sum of
# digits on the left half of its number was equal to
# the sum of digits on the right half. Here are
# examples of such numbers:
#
# 003111    #         3 = 1 + 1 + 1
# 813372    # 8 + 1 + 3 = 3 + 7 + 2
# 17935     #     1 + 7 = 3 + 5
# 56328116  # ???
#
# Such tickets were either eaten after being used
# or collected for bragging rights.
#
# Read the tests carefully and ake them pass.
#
# Credit to SundaySalsa on codewars.com for coming
# up with this problem.

class Lucky
  self.check(str)
    raise if str[0] == nil
    str = str.split('').map { |x| x.to_i }
    split_point = str.size / 2
    str[0..split_point - 1].inject(:+) == str[-split_point..-1].inject(:+)
end
