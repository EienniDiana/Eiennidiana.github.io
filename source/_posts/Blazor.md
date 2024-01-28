---
title : Blazor
---
# Blazor 

## Blazor Web 开发简介

### 	什么是Blazor

​		Blazor是.NET用户界面框架

#### 		什么是  .NET

​			一个完整的生态系统

##### 		什么是Razor

​			一种格式，具有cshtml和razor拓展名，C#和HTML混合

## 生产Web应用

### 	创建Blazor项目

```cmd
dotnet new blazor 项目名 //Blazor Web
dotnet new blazorwasm  项目名 //Blazor WebAssembly
```

### 	Razor 组件

```c#
<p>Current count: @currentCount</p>
<button @onclick="IncrementCount">Click me</button>
@code {
    private int currentCount = 0;
    private void IncrementCount(){currentCount++;}
}
```

### 	数据绑定和事件

#### 		代码指令

​		使用 `@()` 添加与 HTML 内联的 C# 语句。 如需要更多代码，使用 `@code`{} 添加多个语句

​		还可将 `@functions` 部分添加到方法和属性的模板。 它们将添加到生成的类顶部，文档可在其中引用它们

#### 		Page 指令

​		`@page` 

## 样式绑定

```c#

<style scoped>
    .active1 { width:80px; height:80px;}
    .active2 { background-color:#ff6a00;}
</style>
绑定单个css
<div style="font-size:@(fontsize)px">文字</div> 
绑定多个css
<div style="@style.ToString()">文字</div> 
绑定多个class
<div class="@getClass()">文字</div>
@code {
    绑定单个css
    public int fontsize =30;
    绑定多个css
    public class Style
    {
        public int height { get; set; } = 100;
        public int width { get; set; } = 100;
        public override string ToString(){
            return $"width:{width}px;height:{height}px;";
        }
    }
    public Style style = new Style();
    绑定多个class
    public string[] classArray = new string[] { "active1", "active2" };
    public string getClass(){return string.Join(" ", classArray);}
}
```

## 路由

@page “url路径”

App.razor

```c#
<body>
    <Routes />
</body>
```

### 路由参数

```c#
@page "/Route/{keyword}"
@code {
    [Parameter]
    public string keyword { get; set; }
    protected override void OnInitialized(){Console.WriteLine("keyword=" + keyword);}
}
```

### 路由约束

```C#
@page "/Route/{keyword:int}"
@code {
    [Parameter]
    public string keyword { get; set; }
    protected override void OnInitialized(){Console.WriteLine("keyword=" + keyword);}
}
```

### 查询字符

```c#
@page "/querystring"
@using Microsoft.AspNetCore.WebUtilities
@inject NavigationManager NavigationManager
<h3>查询字符串</h3>
<p>keyword Value: @keyword</p>
<p>state Value: @state</p>
@code {
    private string keyword = "";
    private string state = "0";
    protected override void OnInitialized()
    {
        var query = new Uri(NavigationManager.Uri).Query;
 
        Console.WriteLine("query=" + query);
        if (QueryHelpers.ParseQuery(query).TryGetValue("keyword", out var keyword))
        {
            Console.WriteLine("keyword=" + keyword);
        }
        if (QueryHelpers.ParseQuery(query).TryGetValue("state", out var state))
        {
            Console.WriteLine("state=" + state);
        }
    }
}
```

### 类<route-link> NavLink组件

```c#
NavLink和a标签
<NavLink href="http://www.baidu.com">链接到外部地址</NavLink>
<NavLink href="/querystring?keyword=abc&state=1">连接到站内地址</NavLink>
<NavLink href="/navlinkanda" Match="NavLinkMatch.Prefix">匹配前缀</NavLink>
<NavLink href="/navlinkanda?k=123" Match="NavLinkMatch.All">匹配全部</NavLink>
```

## Blazor生命周期

- 设置参数时 (`SetParametersAsync`)
- 组件初始化 (`OnInitialized{Async}`)调用一次
- 设置参数之后 (`OnParametersSet{Async}`)
- 组件呈现之后 (`OnAfterRender{Async}`)
- 状态更改 (`StateHasChanged`)

```c#
@code {
    //设置参数时
    public override Task SetParametersAsync(ParameterView parameters)
    {
        Console.WriteLine("SetParametersAsync ParameterView=" + parameters);
        foreach (var item in parameters)
        {
            Console.WriteLine("parameters item.Name=" + item.Name + ",item.Value=" + item.Value);
        }
        return base.SetParametersAsync(parameters);
    }
	//组件初始化
    protected override void OnInitialized()
    {
        Console.WriteLine("OnInitialized");
        base.OnInitialized();
    }
    //组件呈现之后 
    protected override void OnAfterRender(bool firstRender)
    {
        Console.WriteLine("OnAfterRender firstRender=" + firstRender);
        base.OnAfterRender(firstRender);
    }
    //设置参数之后
    protected override void OnParametersSet()
    {
        Console.WriteLine("OnParametersSet");
        base.OnParametersSet();
    }
}
```

