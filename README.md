# Configs VS Targets
`multiple config files` VS `multiple targets` for different environments

# 开发环境
macOS High Sierra 10.13.4(17E199)

Xcode Version 9.3 (9E145)

# 说明
正常来说，一个project对应一个target，但苹果证书体系和开发过程、测试、发布等因素，很多时候一个project需要应付不同的需求，这个时候，通常有两种选择
1. 多target
2. 单target，多*.xcconfig配置文件

# 分析
根据个人爱好和实际需求，可以选择以上任一方案解决多环境和多渠道发布等问题。相对来说，个人更偏向于第二种方案，更简洁明了，方便管理。

# 注意
如果选择第二种方案，修改xcconfig文件后重新编译，很可能不会立即生效（demo中由脚本beforeBuildShell.sh清除缓存实现实时生效）。
