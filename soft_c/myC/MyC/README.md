# My C Test Program

* 2022-12-26 22:38

---

## 文件结构
```
.
├── binary-tree-sort.c  -- 二叉树排序
├── build               
├── CMakeLists.txt      -- CMake 规则
├── heap-dijkstra.c     -- C 实现的小根堆 + Dijkstra 最短路算法
├── map                 -- 最短路使用的图
├── merge-sort.c        -- 归并排序
├── README.md       
└── soc_io.h            -- 统一编程 API 的一个 fake 文件

12 directories, 62 files
```

## Usage
### 本机测试
```
mkdir -p build && cd build
cmake ..
cmake --build .
```

### 编译 `.coe` 文件
1. 将 `.c` 文件放入 src 中
2. 执行如下指令（`<name>` 为目标文件 e.g. `heap-dijkstra.c` 的 `<name>` 为 `heap-dijkstra`）
```
make clean 
make USER_PROGRAM=<name>
```



