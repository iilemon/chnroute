大陆白名单路由规则

ip段信息取自 [Hackl0us](https://github.com/Hackl0us/GeoIP2-CN)
由Github Action自动构建于此。

策略路由分流的实现方法：

**CN.rsc** 是往Firewall - address lists 里生ip段列表。
```
/file remove [find name="CN.rsc"]
/tool fetch url="https://raw.githubusercontent.com/iilemon/chnroute/refs/heads/main/CN.rsc"
:if ([:len [/file find name=CN.rsc]] > 0) do={
/ip firewall address-list remove [find comment="AS4809"]
/import CN.rsc
}
```

国内访问：
```
/file remove [find name="CN.rsc"]
/tool fetch url="https://cdn.jsdelivr.net/gh/iilemon/chnroute@refs/heads/main/CN.rsc"
:if ([:len [/file find name=CN.rsc]] > 0) do={
/ip firewall address-list remove [find comment="AS4809"]
/import CN.rsc
}
```
用于Firewall - mangle页，通过dst-addrss= 引用

comment 名称仅作为 ROS 脚本引用，无任何实际意义可根据需要自行更改
