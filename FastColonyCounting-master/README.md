FastColonyCounting 
==================

A simple Software running on Matlab 7.0 GUI environment to automatic count  colony number in Image. Use Matlab library and algorithm to realize almost all the function of this software. Only one image can be deal onece now.<br />
一个在Matlab 7.0 下编写的GUI应用软件，用来自动统计图片中的菌落个数。几乎所有功能实现都是基于Matlab本身的库。目前只支持一次处理一张图片。

项目说明
------------------
测试图片在[fastcolonycounting/fig0.jpg](fastcolonycounting/fig0.jpg)<br /> 
![fig0.jpg](fastcolonycounting/fig0.jpg)<br /> 

项目截图
------------------
* 项目主页<br />
![im_1.jpg](screen/im_01_main.png)<br />
* 打开待处理的图片<br />
![im_2.jpg](screen/im_02_open.png)<br /> 

* 边缘检测<br />
![im_3.jpg](screen/im_03_edge.png)<br /> 
* 自动补洞<br />
![im_4.jpg](screen/im_04_fillhole.png)<br /> 
* 腐蚀图像<br />
![im_5.jpg](screen/im_05_corrosion.png)<br /> 
* 膨胀图像<br />
![im_6.jpg](screen/im_06_expand.png)<br /> 
* 分割图像<br />
![im_7.jpg](screen/im_07_split.png)<br /> 
*保存图像<br />
![im_8.jpg](screen/im_08_save.png)<br /> 
* 一键处理数据<br />

> 注意<br /> 
> 需要首先打开图像才能进行处理！<br />

![im_9.jpg](screen/im_09_onekey.png)<br /> 
* 手动选择菌斑进行处理<br /> 

> 处理方法为：<br /> 
> 鼠标左键选择需要统计的菌斑，可以多选。<br /> 
> 双击鼠标则选择结束。<br /> 
![im_10.jpg](screen/im_10_sigle_area.png)<br /> 


License
-------
 Copyright 2015 csulennon

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
