目录:

    assets                   存放资源文件（使用的FlutterAssetsGenerator插件，自动在lib/generated生成配置）
    lib:                     dart代码
        app                  getx路由与页面相关
            routes           getx路由和程序初始化绑定对象
            ui               页面相关
                middleware   get的页面中间件
                page         页面
        config               一些常量
        event                eventBus的消息对象
        extension            扩展的方便函数
        r10n                 国际化的字符串目录
        net                  网络请求相关
            model            网络请求数据model（1手动添加一个model后，需要build ，2使用插件生成实体类插件会帮我们build）
            provider         网络请求的provider，类实现都继承GetConnect
        plugin               写在项目里的一些插件
        service              程序常驻在内存的一些数据，类实现都继承GetxService
        sql                  数据库相关（使用isar）
            model            数据库的数据model（添加一个model后，需要build）
            repository       数据库的操作，实现继承与GetxService，当新增数据库model时，build之后需要在Isar.openSync中加入xxxSchema
        util                 工具类存放
        widget               常用widget，不与getx绑定
    plugin                   一些需要自己修改的第三方插件


android studio插件：

    FlutterAssetsGenerator   自动生成资源文件引用类
    flutter intl             国际化
    FlutterJsonToDart        
                             输入 JSON 数据自动生成带 json_serializable 注解的 dart 模型类
                             如果 pubspec.yaml 文件中没有添加 json_annotation、json_serializable、build_runner 依赖，会自动帮你添加
                             自动执行命令 flutter pub run build_runner build --delete-conflicting-outputs





路由，持久化使用：get

    创建新页面：get_cli( https://pub.flutter-io.cn/packages/get_cli)
    code: get create page:test on ui/page
   
    


flutter  build 命令: 


     flutter packages pub run build_runner build --delete-conflicting-outputs



todo
    
    写一个安卓stuido插件，按照自己的想法生成view,controller,binding,并往routes中插入