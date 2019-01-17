# Codes-for-Metaheuristics-for-VRP-
My codes for 《Metaheuristics for Vehicle Routing Problems》
事在人为。
为了督促自己的学习，特创建此项目，编写从此书中学到的算法代码，第一版使用lua进行编写，第二版C++,最后是python。
2019的最重要的任务。

## 2019-01-17
上次写了一部分，但是突如其来的断电将我的文字湮灭。现在重新更新，做最好的自己。


### 2.2. Local search
这是非常重要的一章，可以说是所有启发式算法的灵魂。因为所有的最优化算法都可以看做local search，比如，simplex、column generation，本质上也都是一种搜索方法。而每个搜索，都是从当前incumbent solution，沿着一定方向，再行走一定的步长，达到下一个解。但是下一个解是好是坏，是更好或更坏，只能通过目标函数的测算得到。
书中说道
> Tish section gives the general structure of a local search, presents classical moves and discusses important issues such as 

**feasibility tests, genericity, multiple neighborhoods, very contrained problems, complex moves and acceleration techniques**.

improvement or local search 的指导思想就是，我现在的生活状况，我也不知道是不是最好的，那么我就去折腾，往各个方向折腾，学英语，学编程，学为人处世，然后发现学了英语后，我的个人价值确实提高了，那么我就找到了一个更好的解。但如果我去学人杀人放火，干完一票后，发现自己进局子了，那我就换到了一个更差的解中。
此时，我们就做一个尝试，然后一直得到更好的解，直到再怎么折腾都不能进步了，我就到达了人生巅峰。

__initial solution__  
__neighborhood__  
__move__  


