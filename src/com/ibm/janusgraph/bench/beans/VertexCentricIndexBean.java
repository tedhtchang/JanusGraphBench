package com.ibm.janusgraph.bench.beans;

import java.util.List;

public class VertexCentricIndexBean{
    String name = null;
    String edge = null;
    List<String> propertyKeys;
    String order = "incr";
    String direction = "BOTH";
}