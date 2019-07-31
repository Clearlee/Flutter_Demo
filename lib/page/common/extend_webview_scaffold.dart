import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class ExtendWebviewScaffold extends StatefulWidget {

  const ExtendWebviewScaffold({
    Key key,
    this.appBar,
    @required this.url,
    this.headers,
    this.withJavascript,
    this.clearCache,
    this.clearCookies,
    this.enableAppScheme,
    this.userAgent,
    this.useWideViewPort,
    this.primary = true,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.withZoom,
    this.withLocalStorage,
    this.withLocalUrl,
    this.scrollBar,
    this.supportMultipleWindows,
    this.appCacheEnabled,
    this.hidden = false,
    this.initialChild,
    this.allowFileURLs,
    this.resizeToAvoidBottomInset = false,
    this.invalidUrlRegex,
    this.geolocationEnabled
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final String url;
  final Map<String, String> headers;
  final bool withJavascript;
  final bool clearCache;
  final bool clearCookies;
  final bool enableAppScheme;
  final String userAgent;
  final bool primary;
  final List<Widget> persistentFooterButtons;
  final Widget bottomNavigationBar;
  final bool withZoom;
  final bool withLocalStorage;
  final bool withLocalUrl;
  final bool scrollBar;
  final bool supportMultipleWindows;
  final bool appCacheEnabled;
  final bool hidden;
  final Widget initialChild;
  final bool allowFileURLs;
  final bool resizeToAvoidBottomInset;
  final String invalidUrlRegex;
  final bool geolocationEnabled;
  final bool useWideViewPort;

  @override
  _ExtendWebviewScaffoldState createState() => _ExtendWebviewScaffoldState();
}

class _ExtendWebviewScaffoldState extends State<ExtendWebviewScaffold> {
  final webviewReference = FlutterWebviewPlugin();
  Rect _rect;
  Timer _resizeTimer;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  var _onBack;

  @override
  void initState() {
    super.initState();
    webviewReference.close();

    _onBack = webviewReference.onBack.listen((_) async {
      if (!mounted) return;

      // Equivalent of Navigator.maybePop(), except that [webviewReference]
      // is closed when the pop goes ahead. Whether the pop was performed
      // can't be determined from the return value of Navigator.maybePop().
      final route = ModalRoute.of(context);
      final pop = await route?.willPop();
      if (pop == RoutePopDisposition.pop) {
        webviewReference.close();
        Navigator.pop(context);
      }
    });

    if (widget.hidden) {
      _onStateChanged =
          webviewReference.onStateChanged.listen((WebViewStateChanged state) {
        if (state.type == WebViewState.finishLoad) {
          webviewReference.show();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _onBack?.cancel();
    _resizeTimer?.cancel();
    webviewReference.close();
    if (widget.hidden) {
      _onStateChanged.cancel();
    }
    webviewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      persistentFooterButtons: widget.persistentFooterButtons,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: _WebviewPlaceholder(
        onRectChanged: (Rect value) {
          if (_rect == null) {
            _rect = value;
            webviewReference.launch(
              widget.url,
              headers: widget.headers,
              withJavascript: widget.withJavascript,
              clearCache: widget.clearCache,
              clearCookies: widget.clearCookies,
              hidden: widget.hidden,
              enableAppScheme: widget.enableAppScheme,
              userAgent: widget.userAgent,
              rect: _rect,
              withZoom: widget.withZoom,
              withLocalStorage: widget.withLocalStorage,
              withLocalUrl: widget.withLocalUrl,
              scrollBar: widget.scrollBar,
              supportMultipleWindows: widget.supportMultipleWindows,
              appCacheEnabled: widget.appCacheEnabled,
              allowFileURLs: widget.allowFileURLs,
              invalidUrlRegex: widget.invalidUrlRegex,
              geolocationEnabled: widget.geolocationEnabled,
              useWideViewPort: widget.useWideViewPort
            );
          } else {
            if (_rect != value) {
              _rect = value;
              _resizeTimer?.cancel();
              _resizeTimer = Timer(const Duration(milliseconds: 250), () {
                // avoid resizing to fast when build is called multiple time
                webviewReference.resize(_rect);
              });
            }
          }
        },
        child: widget.initialChild ?? const Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}

class _WebviewPlaceholder extends SingleChildRenderObjectWidget {
  const _WebviewPlaceholder({
    Key key,
    @required this.onRectChanged,
    Widget child,
  }) : super(key: key, child: child);

  final ValueChanged<Rect> onRectChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _WebviewPlaceholderRender(
      onRectChanged: onRectChanged,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _WebviewPlaceholderRender renderObject) {
    renderObject..onRectChanged = onRectChanged;
  }
}

class _WebviewPlaceholderRender extends RenderProxyBox {
  _WebviewPlaceholderRender({
    RenderBox child,
    ValueChanged<Rect> onRectChanged,
  })  : _callback = onRectChanged,
        super(child);

  ValueChanged<Rect> _callback;
  Rect _rect;

  Rect get rect => _rect;

  set onRectChanged(ValueChanged<Rect> callback) {
    if (callback != _callback) {
      _callback = callback;
      notifyRect();
    }
  }

  void notifyRect() {
    if (_callback != null && _rect != null) {
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final rect = offset & size;
    if (_rect != rect) {
      _rect = rect;
      notifyRect();
    }
  }
}
