import 'package:flutter/material.dart';

// appbar 搜索框组件

class SAppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  const SAppBarSearch({
    this.elevation = 0,
    this.borderRadius = 20,
    this.autoFocus = false,
    this.focusNode,
    this.controller,
    this.height = 40,
    this.value,
    this.leading,
    this.suffix,
    this.actions = const [],
    this.hintText,
    this.onTap,
    this.onClear,
    this.onCancel,
    this.onChange,
    this.onSearch,
  });

  final double borderRadius;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  // appbar 阴影
  final double elevation;

  // 输入框高度 默认40
  final double height;

  // 默认值
  final String? value;

  // 搜索框前面组件
  final Widget? leading;

  // 搜索框后面组件
  final Widget? suffix;
  final List<Widget> actions;

  // 提示文字
  final String? hintText;

  // 输入框点击
  final VoidCallback? onTap;

  // 单独清除输入框内容
  final VoidCallback? onClear;

  // 清除输入框内容并取消输入
  final VoidCallback? onCancel;

  // 输入框内容改变
  final ValueChanged? onChange;

  // 点击键盘搜索
  final ValueChanged? onSearch;

  @override
  _SAppBarSearchState createState() => _SAppBarSearchState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SAppBarSearchState extends State<SAppBarSearch> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool isInput = false;

  bool get isFocus => _focusNode.hasFocus;

  bool get isTextEmpty => _controller.text.isEmpty;

  bool get isActionEmpty => widget.actions.isEmpty;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller.text = widget.value ?? '';
    _focusNode.addListener(() {
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
      widget.onChange?.call(_controller.text);
    });
    super.initState();
  }

  void _onClearInput() {
    _controller.clear();
    if (!isFocus) {
      _focusNode.requestFocus();
      setState(() {});
      widget.onClear?.call();
    }
  }

  void _onCancelInput() {
    _controller.clear();
    _focusNode.unfocus();
    setState(() {});
    widget.onCancel?.call();
  }

  Widget _suffix() {
    if (!isTextEmpty) {
      return GestureDetector(
        onTap: _onClearInput,
        child: SizedBox(
          width: widget.height,
          height: widget.height,
          child: Icon(
            Icons.cancel,
            size: 20,
            color: Color(0xFF999999),
          ),
        ),
      );
    }
    return widget.suffix ?? SizedBox();
  }

  List<Widget> _action() {
    List<Widget> list = [];
    if (isFocus || !isTextEmpty) {
      list.add(GestureDetector(
        onTap: _onCancelInput,
        child: Container(
          constraints: BoxConstraints(minWidth: 48),
          alignment: Alignment.center,
          child: Text(
            '取消',
            style: TextStyle(color: Color(0xFF666666), fontSize: 15),
          ),
        ),
      ));
    } else if (!isActionEmpty) {
      list.addAll(widget.actions);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasDrawer = scaffold.hasDrawer ?? false;
    double left = !canPop && !hasDrawer && widget.leading == null ? 15 : 0;
    double right = isActionEmpty && !isFocus && isTextEmpty ? 15 : 0;
    return AppBar(
      elevation: widget.elevation,
      titleSpacing: 0,
      leading: isFocus ? SizedBox() : widget.leading,
      leadingWidth: isFocus ? 15 : kToolbarHeight,
      title: Container(
        margin: EdgeInsets.only(right: right, left: left),
        height: widget.height,
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Row(
          children: [
            SizedBox(
              width: widget.height,
              height: widget.height,
              child: Icon(
                Icons.search,
                size: 22,
                color: Color(0xFF999999),
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: widget.autoFocus,
                focusNode: _focusNode,
                controller: _controller,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hintText ?? '请输入关键字',
                  hintStyle: TextStyle(fontSize: 15, color: Color(0xFF999999)),
                ),
                style: TextStyle(
                    fontSize: 15, color: Color(0xFF333333), height: 1.3),
                textInputAction: TextInputAction.search,
                onTap: widget.onTap,
                onSubmitted: widget.onSearch,
              ),
            ),
            _suffix(),
          ],
        ),
      ),
      actions: _action(),
    );
  }
}
