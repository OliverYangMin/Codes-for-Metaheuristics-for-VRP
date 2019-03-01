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
> This section gives the general structure of a local search, presents classical moves and discusses important issues such as **feasibility tests, genericity, multiple neighborhoods, very contrained problems, complex moves and acceleration techniques**.

improvement or local search 的指导思想就是，我现在的生活状况，我也不知道是不是最好的，那么我就去折腾，往各个方向折腾，学英语，学编程，学为人处世，然后发现学了英语后，我的个人价值确实提高了，那么我就找到了一个更好的解。但如果我去学人杀人放火，干完一票后，发现自己进局子了，那我就换到了一个更差的解中。
此时，我们就做一个尝试，然后一直得到更好的解，直到再怎么折腾都不能进步了，我就到达了人生巅峰。

__initial solution__  
__neighborhood__  
__move__  

## 2019-03-01
自上次更新，放假回家躺尸40余天，发现居然还有人看这个项目，所以我得开始更新了。
## 2.1 Simple heuristics
   在上古时期，由于知识水平及硬件限制，远古大佬们想出了许多简单，实用的算法求解那些复杂的问题，比如呢？这里要明白一个道理，没有你们这些研究VRP的朋友，人家公司就不会送货了么？虽然NP-hard问题找到一个可行解都是很难的，但是架不住我多买两辆车。
    
运营者自己便会相处许多简单可行的方法来解决这个问题，这些简单的启发式算法能够build a single solution作为基于search的元启发式算法的**initial solution**。这些启发式算法具有简单易行，计算速度快，能得到较好的解的特点，因此被许多商业化软件所采用。其应对**side constraints**变种的能力也不错。
### 2.1.1 Constructive heurisitcs
  TSP作为特殊的简单的VRP问题，为VRP问题的求解提供了许多经验和方法。  
-ad_hoc

每个客户点直接派出一辆车辆专门服务，虽然成本剧增，但架不住大爷我乐意。此方法作为包括CW算法在内的多种算法的初始解。

2.nearest_neighbor
  要想让总距离降低，我就秉承一个原则，__就近原则__。在生成路径的过程中，每次都寻找当前节点的下一个最近的客户点，加入路径。这也属于一种基本的
Greedy Algorithm。但在选用此算法时，出现了一个决策（类似机器学习中的超参数设置），我是一辆车一辆车安排呢，还是，同时并发好几辆？    
前者被叫做**Sequential route building policy**，后者叫**Parallel route building policy**，这两种策略经常出现，需要我们选择。   
  为啥要并行呢？有两个原因，一是你无法预估最后会构成多少条路径，二是是最后的那条路径属于捡破烂，可能就只有一两个客户点，这样imbalance的结果，大概率是不好的。当选择了并行策略后，我们又面临了一个决策，用多少辆车去并发呢？这个K辆车的选择，有很多种方法，之后再讲，反正至少可以求出一个lower bound，通过  __math.ceil(客户点总需求/车辆容量)__ 得到。
  总得来说，这个算法和KNN有类似的地方，可以顺带学习。
  
3.Clarke_Wright heuristic
这个算法的提出，应该对VRP求解的发展起到了关键作用，我认为这是求解VRP的构造性算法中最强的。
三角形规则是这个算法的理论基础，我们可知，在空间上，三个点组成的三角形，任意两边的距离和大于等于第三边。这个原则在后面的算法中也及其重要，也是我们对数据进行分析时必须要检测的一步。

### 2.1.2 Two-phase methods
  两阶段算法，通常用来将复杂的问题的分成几个阶段进行求解，也就是在生活中通常用到的，先做什么，后做什么。这种策略的好处是能够将复杂的问题进行简化，但是凡事都有两面性，这样可能会排出掉一些更好的解。
  相对VRP问题，TSP问题就显得简单的多，而且由于容量的限制，通常分配给一辆车的任务不会超过50点，这个量级的TSP使用动态规划技术，可以直接得到最优解。因此我们通过Cluster-first， route-second 策略，将VRP问题分割成若干个TSP问题，然后分别对各个TSP问题进行求解，得到一个相对较优的解。
#### Sweep





