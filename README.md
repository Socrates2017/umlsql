## 简介

  本程序可以将在plantuml上进行数据建模的原始文件，直接转化为SQL建表语句。

## 使用示例  
        public static void main(String[] args) throws FileEmptyException {
    
            String umlFilePath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel.puml";
            String sqlPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel.sql";
            String odsPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel_ods.sql";
            String triggerPath = "E:\\github\\umlsql\\umlsql\\uml\\dataModel_trigger.sql";
    
            Uml2SqlConfig uml2SqlConfig = new Uml2SqlConfig(umlFilePath, sqlPath);
            Sql2OdsConfig sql2OdsConfig = new Sql2OdsConfig(sqlPath, odsPath);
    
            OdsTriggerConfig odsTriggerConfig = new OdsTriggerConfig(sqlPath, triggerPath);
            odsTriggerConfig.setOdsDbName("ods_charge");
    
            Uml2SqlUtil.transformAndSave(uml2SqlConfig);
            Sql2OdsUtil.transformAndSave(sql2OdsConfig);
            OdsTriggerUtil.transformAndSave(odsTriggerConfig);
    
        }


## plantuml文档

    https://plantuml.com/zh/
  
## PlantUML导出大图被截取和乱码问题
    
    IDEA中的PlantUML插件导出大图的时候只导出了部分，如果缩小后导出放大将模糊。
    使用PlantUML官方提供的jar包导出存在一样的问题同时中文将乱码。   
    因为PlantUML限制图像的宽度和高度为4096。如果长度超出范围将截取。
    而中文乱码是由于PlantUML使用平台（系统）的默认字符集（一般是windows-1252）。    
    解决方法是使用PlantUML官方提供的jar导出PNG图像。并且设置对应的参数解决以上的2个问题。
    
    图像宽高限制
    打开PlantUML官网，找到plantuml.jar下载。随便找一个目录放置就好（例如：e盘根目录下）。
    Plantuml.jar是Java语言开发的，所以需要提前配置好Java环境变量。
    Win + R -> cmd打开命令命令窗口，切换到plantuml.jar的目录下。
    -DPLANTUML_LIMIT_SIZE参数是设置图像的宽高，需要设置对应的大小即可。如果图像很大会存在内存问题。需要将参数-Xml1024m添加到Java虚拟机。

    完整命令：
    java -DPLANTUML_LIMIT_SIZE=8192 -jar plantuml.jar -charset UTF-8 E:\doc\index.puml
  
  
  
## dot Executable:null的问题

    在官网下载graphviz（https://graphviz.gitlab.io/_pages/Download/Download_windows.html），安装添加环境变量。
    在命令行输入dot -version 检测，如果显示版本信息，说明安装成功。然后重启idea即可成功，效果如下图：
    
    