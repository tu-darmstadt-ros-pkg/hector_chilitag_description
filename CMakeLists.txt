cmake_minimum_required(VERSION 2.8.3)
project(hector_chilitag_description)

find_package(catkin REQUIRED COMPONENTS
  urdf
  xacro
)

catkin_package(

)

install(DIRECTORY meshes urdf
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
