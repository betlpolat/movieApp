import 'package:flutter/material.dart';

/// Project general border radius items
final class ProjectBorderRadius extends BorderRadius {
  /// [ProjectBorderRadius.allLow] is 2
  const ProjectBorderRadius.allLow() : super.all(const Radius.circular(2));

  /// [ProjectBorderRadius.allNormal] is 4

  const ProjectBorderRadius.allNormal() : super.all(const Radius.circular(4));

  /// [ProjectBorderRadius.allMedium] is 8

  const ProjectBorderRadius.allMedium() : super.all(const Radius.circular(8));

  /// [ProjectBorderRadius.allHigh] is 16

  const ProjectBorderRadius.allHigh() : super.all(const Radius.circular(16));
}
