# State

vim regex: `\v(\<([scam]-)*)(tab|cr|bs|left|right|up|down|space|.)\>`

```dot
digraph G  {
    rankdir = LR;
    graph[bgcolor=dark]
    node [shape = circle];
    subgraph cluster_1 {
        label = "字典树";
    }
    subgraph cluster_0 {
        label = "状态机";
        q0 -> q1 [label="<"];
        q1 -> {字典树, q3} [label="ε"];

        // INFO :
        q3 -> q4 [label="[scam]"];
        q4 -> q1 [label="-"];
    }

}
```
