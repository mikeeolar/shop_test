import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class BasePartialBuild<T extends BaseViewModel> extends StackedHookView<T> {
  final Function(BuildContext, T) builderr;

  const BasePartialBuild(
      {Key? key, required this.builderr, bool reactive = false})
      : super(key: key, reactive: reactive);

  @override
  Widget builder(BuildContext context, T model) =>
      builderr(context, model) as Widget;
}

class ReactivePartialBuild<T extends ReactiveViewModel>
    extends StackedHookView<T> {
  final Function(BuildContext, T) builderr;

  const ReactivePartialBuild(
      {Key? key, required this.builderr, bool reactive = true})
      : super(key: key, reactive: reactive);

  @override
  Widget builder(BuildContext context, T model) => builderr(context, model);
}
