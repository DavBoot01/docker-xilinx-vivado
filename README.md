Xilinx-Vivado/Vitis
===============================================================================

Xilinx Vivado and Vitis Docker 
Current version: Xilinx Vivado 2022.1

Description
-------------------------------------------------------------------------------

Xilinx Vivado and Vitis 2020.1 docker.

Content
-------------------------------------------------------------------------------

- ``resources``: folder containing third-part file, including the Xilin ISE installation file;
- ``image_addon``: folder containing materials used for the customization of the image during the building step;
- ``doc``: folder containing material for this documentation;
- ``launcher``: set of tools used to run and use the builded image: -
  - script used to run the image;
  - docker-compose file to run the container in a structured environment
  - application launcher to add to your distro
  - the ``xilinx_home_folders``  contains the folders used as volumes for /home/vivado/.Xilinx and /home/vivado/.config/Xilinx folders inside the docker image. This behavior allows storing the IDE's settings and use theme on each session.

> **_NOTE:_**  The ``xilinx_home_folders`` should be copied (or/and re-named it) everywhere you want. The right path inside the scripts used as launcher have to be replaced with the default ones. For how to do this, see the "Prepare for the usage" paragraph.


Requirements
-------------------------------------------------------------------------------

- Make sure you have at enough space available to create the docker image. The install files take 6GB, the final image has about 91GB.

- Obtain the Xilinx Vivado installation file via the [Download page](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html) and select the [ Vivado HLx 2020.1: All OS installer Single-File Download](https://www.xilinx.com/member/forms/download/xef.html?filename=Xilinx_Unified_2020.1_0602_1208.tar.gz) (requires authentications).

    ![image](doc/installer_website_01.png)

    ![image](doc/installer_website_02.png)


Prepare for the building
-------------------------------------------------------------------------------

- Assuming that the installation file is named ``Xilinx_Unified_2020.1_0602_1208.tar.gz``, copy it into the ``resouces`` folder;


How to build the image
-------------------------------------------------------------------------------

Run docker build script:
```
./build.sh
```

Prepare for the usage
-------------------------------------------------------------------------------

- Copy Xilinx.lic licence file into ```launcher/xilinx_home_folders/Xilinx``` (or everywhere you have placed the folder ``xilinx_home_folders``)

- Select and eventually create a folder used as WORKDIR folder (please, see below on how to use the script)


How to run the IDE
-------------------------------------------------------------------------------

### Use script

Open the file ``launcher/script/vivado`` and set these variables in accordance with your environment:

``XILINX_HOME_FOLDERS``: full path of the folder ``xilinx_home_folders`` (default /opt/dockers/xilinx_home_folders/
)

``WORKDIR``: folder to use to store your projects

``HOSTNAME``: hostname used during the creation of the licence file (default is ```$(hostname)```)

To open Vivado IDE run:

```
./launcher/script/vivado
```

> **Note:** Copy this script in one of the folder included into ``$PATH`` environment variable in order to launch it whereever you are

### Use docker-compose

Open the file ```launcher/docker-compose/docker-compose_vivado_2020.1.yml``` and set following volumes in accordance with you environment:

```/opt/dockers/xilinx_home_folders/```Xilinx:/home/vivado/.Xilinx:rw : analogous of ``XILINX_HOME_FOLDERS`` variable

```/home/davide/vivado```:/home/vivado/workdir:rw : analogous of ``WORKDIR`` variable


Create an application launcher
-------------------------------------------------------------------------------

- Copy launcher/script/ise into /usr/bin (or into one of the path presents into PATH varible)

- Add an application launcher through one of the possible way. For example via the Menu Editor (follow the step by step procedure used under KDE)
    - Right click on "Application launcher" icon

        ![image](doc/app_launcher_01.png)

    - Go in "Development" (or everywhere you want to add the new launcher) and click on "New Item...

        ![image](doc/app_launcher_02.png)

    - Give to the new item the name you prefer (e.g. "Xilinx Vivado") and add the icon presents to the folder launcher/ise.png (or where you have placed it). 
    
        - As command type ```xterm -e "vivado"``` if you want to use the script as launcher (assuming placed in, e.g. /usb/bin)

            ![image](doc/app_launcher_03.png)

        - As command type ```xterm -e "docker-compose -f /opt/docker_compose/docker-compose_vivado_2020.1.yml up"``` if you want to use the docker compose as launcher (assuming placed in, e.g. /opt/docker_compose folder)

            ![image](doc/app_launcher_04.png)

    - Click on "Save". Done.

References
-------------------------------------------------------------------------------

- https://support.xilinx.com/s/question/0D52E00006iHsm5SAC/hostid-not-found-properly-by-license-manager-vivado-20154-nodelocked-license-ubuntu?language=en_US
- https://docs.docker.com/engine/reference/commandline/network_create/