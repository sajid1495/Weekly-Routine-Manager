import 'package:flutter/material.dart';

class SortList {
  List sortV(List vm) {
    List v = [];
    List v1 = [];
    List v12 = [];
    List vf = [];
    String s;

    for (int i = 0; i < vm.length; i++) {
      s = vm[i];
      if (s[0] == '1') {
        if (s[1] == '2') {
          v12.add(s);
        } else if (s[1] == '0' || s[1] == '1') {
          v1.add(s);
        } else if (s[1] == ':') {
          v.add(s);
        }
      } else if (s[0] != '1') {
        v.add(s);
      }
    }

    v12.sort();
    v.sort();
    v1.sort();

    vf.addAll(v12);
    vf.addAll(v);
    vf.addAll(v1);

    return vf;
  }

  List sortData(List toDoList) {
    String s;
    int n = toDoList.length;
    List vpm = [];
    List vam = [];
    List vamf = [];
    List vpmf = [];

    for (int i = 0; i < n; i++) {
      s = toDoList[i];
      for (int j = 0; j <= 8; j++) {
        if (s[j] == 'M') {
          if (s[j - 1] == 'A') {
            vam.add(s);
            break;
          } else {
            vpm.add(s);
            break;
          }
        }
      }
    }

    vamf = sortV(vam);
    vpmf = sortV(vpm);

    List finalList = [];
    finalList.addAll(vamf);
    finalList.addAll(vpmf);
    return finalList;
  }
}
