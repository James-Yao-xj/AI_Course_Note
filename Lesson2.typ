#import "@preview/ctyp:0.3.0": ctyp
#let (ctypset, cjk) = ctyp()
#let (song, hei, kai, fang) = cjk
#show: ctypset

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 1cm, right: 1cm),
  header: context [
    #text(8pt, gray)[Python编程基础]\
  ],
  numbering: "1"
)

#set heading(numbering: "1.")

#align(center)[
  #text(size: 24pt, weight: "bold")[第二讲]\
  #v(10pt)
  #text(size: 16pt)[——数学基础——]
]
= 数学基础

== 回归(Regression)

$x -> y$的一个映射

问题定义：在一组数据点中，找到一个多项式函数，尽可能拟合数据分布的趋势(Ristribution)。

如何评判拟合效果？

差异函数（误差函数）： #footnote[误差函数与课件的形式不符合，我们认为课件的公式需要乘以$1 / N$才是合理的，前面的系数$1 / 2$的解释是为了求一阶导数系数方便计算。]

$
  f(x, w) = w_0 + w_1 x + w_2 x^2 + ... + w_M x^M\


  E(w) = 1 / (2 N) sum_( i = 1) ^ N (y_i - f(x_i, w))^2
$

$M$的数值越大，模型容量(capacity)越大，拟合能力越强，但过拟合(overfitting)的风险也越大。

*过拟合*：Overfitting只是拟合了绝大多数点，但是并不能很好的表现数据的趋势，在其他数据测试中表现得很差。这种情况的特点是$M$特别大，模型过于复杂，拟合了训练数据中的噪声，而不是数据的真实趋势。

*欠拟合*：Underfitting 是指模型在训练数据上表现不好，无法捕捉数据的趋势。这通常是因为模型过于简单，无法拟合训练数据。

*过拟合的解决方法*：增加数据量，权重正则化。

== 概率论

=== 概率的定义
*频率学派*：一个事件的概率是该事件发⽣次数占总试验次数的比例

*贝叶斯学派*：概率是表达个⼈或主观信念的不确定性的度量

联合概率：事件$X = X_i$ 与事件$Y = Y_j$同时发生的概率，记为$p(X = X_i, Y = Y_j)$

加和规则（全概率公式）：
$
  p(X) = sum_(i = 1) ^ n p(X|Y = Y_i) p(Y = Y_i)
$

贝叶斯定理：
$
  p(X|Y) = (p(X|Y) p(Y)) / (sum _ Y p(X|Y) p(Y)) prop p(X|Y) p(Y)
$

$p(Y|X)$：后验概率(posterior)：当观察到X的结果之后的概率。

$p(X|Y)$：似然(likelihood)：在给定Y的条件下，X发生的概率，它表达了
对于参数y的不同设置，观测到的数据集有多大的可能性。

$p(Y)$：先验概率(prior)：在观察到数据之前的概率，我们对y的猜测。

*独立事件*：两个事件相互独立，意味着一个事件的发生不影响另一个事件发生的概率。即 
$
p(X, Y) = p(X) p(Y), \ p(X) = p(X|Y),  p(Y) = p(Y|X).
$

$p(x)$：概率密度函数(probability density function)，它描述了连续随机变量在某个特定值附近取值的概率密度。对于连续随机变量，概率密度函数的积分在某个区间内给出了该区间内随机变量取值的概率。

$P(x)$：累积分布函数(cumulative distribution function)，它描述了随机变量取值小于或等于某个特定值的概率。对于连续随机变量，累积分布函数是概率密度函数的积分。

关系：$P(x) = integral_(-oo) ^ z p(x) dif x$

数学期望：$EE(x) = sum p(x) dot x$

方差：描述数据的离散程度。

协方差：$C o v(x, y) = E_(x, y) (x - EE(x))(y - EE(y)) = E_(x,y) - EE(x) EE(y)$

高斯分布/正态分布：$p(x) = (1 / sqrt(2 pi sigma^2)) exp(-(x - mu)^2 / (2 sigma^2))$

=== 频率学派：最大似然估计(MLE)

例子：某个班级的智商服从正态分布$N(mu, sigma^2)$，那么$mu, sigma$是_等待估计的参数_，从这个班随机抽取五个人，测得他们的智商数值，分别是$x_1, x_2, x_3, x_4, x_5$，那么我们可以通过最大似然估计来估计$mu$和$sigma$的值。最大似然估计是指，在给定观测数据的情况下，选择使得观测数据出现的概率最大的参数值。

=== 贝叶斯学派：最大后验概率
最大后验概率(MAP)估计是指，在给定观测数据的情况下，选择使得参数的后验概率最大的参数值。与最大似然估计不同，最大后验概率估计还考虑了先验概率，即在观察到数据之前对参数的猜测。