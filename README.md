# SwiftyDataStructure
Implement common Data Structure by Swift 

## Implemented
* 链表
* 队列
* 二叉树

## 特性
* 所有数据结构支持泛型
* 队列支持自动扩容
* 二叉树的前中后层序遍历

## 链表
### 单链表/双向链表/循环链表 API
```
/// 在链表头部添加节点 ( Add a node to the head of the linked list )
func append(atHead newElement: E)
/// 在链表尾部添加节点 ( Add node at the end of the list )
func append(atTail newElement: E)
/// 插入节点 ( Insert node )
func insert(_ newElement: E, at i: Int)
/// 移除节点 ( Remove node )
func remove(at index: Int) -> E?
/// 移除头部节点 ( Remove head node )
func removeFirst() -> E?
/// 移除尾部节点  ( Remove tail node )
func removeLast() -> E?
/// 移除所有节点
func removeAll()
/// 更新节点 ( Update node )
func update(at index: Int, _ newElement: E)
/// 获取节点值
func index(of index: Int) -> E?
/// 是否包含 element
func contains(_ element: E) -> Bool
/// 获取链表所有元素 (Get all the elements of the linked list)
func getAllElements() -> [E]
```

## 队列
### 队列 API
```
/// 队列是否为空 (Is the queue empty)
public var isEmpty: Bool 
/// 队列是否已满 (Is the queue full)
public var isFull: Bool 
/// 队头 (The first element of queue)
public var first: Element? 
/// 队列元素数量 (Number of queue elements)
public var count: Int
/// 入队 (Enter Queue)
public mutating func append(_ newElement: Element) 
/// 出队 (Dequeue)
public mutating func popFirst() -> Element? 
```

### 双端队列
### 循环队列
