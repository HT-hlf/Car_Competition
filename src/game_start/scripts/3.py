#encoding=UTF-8
import rospy
from geometry_msgs.msg import Twist
from math import pi

class ForwardAndBack():
  def __init__(self):
    rospy.init_node('forward_and_back', anonymous=False)
    rospy.on_shutdown(self.shutdown)
    # this "forward_and_back" node will publish Twist type msgs to /cmd_vel 
    # topic, where this node act like a Publisher 
    self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
    
    # parameters
    rate = 50
    r = rospy.Rate(rate)
    
    linear_speed = 0.2
    goal_distance = 5
    linear_duration = goal_distance/linear_speed
    
    angular_speed = 1.0
    goal_angular = pi
    angular_duration = goal_angular/angular_speed
    
    # forward->rotate->back->rotate
    for i in range(2):
      # this is the msgs variant, has Twist type, no data now
      move_cmd = Twist()

      move_cmd.linear.x = linear_speed # 
      # should keep publishing
      ticks = int(linear_duration*rate)
      for t in range(ticks):
      # one node can publish msgs to different topics, here only publish
      # to /cmd_vel
        self.cmd_vel.publish(move_cmd)
        r.sleep # sleep according to the rate
        
      # stop 1 ms before ratate
      move_cmd = Twist()
      self.cmd_vel.publish(move_cmd)
      rospy.sleep(1)
      
      move_cmd.angular_speed.z = angular_speed
      ticks = int(angular_duration*rate)
      for t in range(ticks):
        self.cmd_vel.publish(move_cmd)
        r.sleep()

    self.cmd_vel.publish(Twist())
    rospy.sleep(1)
    
  def shutdown(self):
    rospy.loginfo("Stopping the robot")
    self.cmd_vel.publish(Twist())
    rospy.sleep(1)
    
if __name__=='__main__':
  try:
    ForwardAndBack()
  except:
    rospy.loginfo("forward_and_back node terminated by exception")

