function [xsup,w,d,pos,timeps,alpha,obj]=svmclass(x,y,c,lambda,kernel,kerneloption,verbose,span, alphainit)
% USAGE [xsup,w,b,pos,timeps,alpha,obj]=svmclass(x,y,c,lambda,kernel,kerneloption,verbose,span, alphainit)
%
% Support vector machine for CLASSIFICATION
% This routine classify the training set with a support vector machine
% using quadratic programming algorithm (active constraints method)
%
% INPUT
%
% Training set
%      x  		: input data  输入数据
%      y  		: output data  输出数据
% parameters
%		c		: Bound on the lagrangian multipliers           0<a<C
%		lambda		: Conditioning parameter for QP method  %%调节QP优化的参数
%		kernel		: kernel  type. classical kernel are      
%
%		Name			parameters
%		'poly'		polynomial degree
%		'gaussian'	gaussian standard deviation
%
%		for more details see svmkernel
% 
%		kerneloption : parameters of kernel
%
%		for more details see svmkernel
%
% 		verbose : display outputs (default value is 0: no display)  %%显示输出
% 		默认值是0 不显示输出
%
%     Span    : span matrix for semiparametric learning 
%               This vector is sized Nbapp*Nbbasisfunction where
%               phi(i,j)= f_j(x(i));
%
%
%
% OUTPUT
%
% xsup	coordinates of the Support Vector
% w      weight
% b		bias
% pos    position of Support Vector
% timeps time for processing the scalar product
% alpha  Lagragian multiplier  拉格朗日系数
% obj    Value of Objective function  价值目标函数的
%
%
% see also svmreg, svmkernel, svmval

%	21/09/97 S. Canu
%	04/06/00 A. Rakotomamonjy   -inclusion of other kernel functions
%	04/05/01 S. Canu            -inclusion of multi-constraint optimization for frame-SVM
%
%       scanu@insa-rouen.fr, alain.rakoto@insa-rouen.fr


if nargin< 9
    alphainit=[];
end;

if nargin < 8 | isempty(span)
    A = y;
    b = 0;
else
    if span==1
        span=ones(size(y));
    end;
    [na,m]=size(span);
    [n un] = size(y);
    if n ~= na
        error('span, x and y  must have the same number of row')
    end
    A = (y*ones(1,m)).*span;
    b = zeros(m,1);
end
if nargin < 7
    verbose = 0;
end

if nargin < 6
    gamma = 1;
end

if nargin < 5
    kernel = 'gaussian';
end

if nargin < 4
    lambda = 0.000000001;
end

if nargin < 3
    c = inf;
end


[n un] = size(y);

if ~isempty(x)
    [nl nc] = size(x);
    if n ~= nl
        error('x and y must have the same number of row')
    end
end;

if min(y) ~= -1
    error(' y must coded: 1 for class one and -1 for class two')
end

if verbose ~= 0 disp('building the distance matrix'); end;%%显示输出的话构建距离矩阵？

ttt = cputime;

ps  =  zeros(n,n);		
ps=svmkernel(x,kernel,kerneloption);


%----------------------------------------------------------------------
%      monqp(H,b,c) solves the quadratic programming problem:
% 
%    min 0.5*x'Hx - d'x   subject to:  A'x = b  and  0 <= x <= c 
%     x    
%----------------------------------------------------------------------
H =ps.*(y*y'); 
e = ones(size(y));%%n个1的 列向量

timeps = cputime - ttt;

if verbose ~= 0 disp('in QP'); end;    %%若verbose不是0 ，就显示inQP
if isinf(c)   %%%如果c是无穷大                                                        
    [alpha , lambda , pos] =  monqpCinfty(H,e,A,b,lambda,verbose,x,ps,alphainit);  
else         %%%%如果c不是无穷大                                                        
    [alpha , lambda , pos] = monqp(H,e,A,b,c,lambda,verbose,x,ps,alphainit);      %%输出的lambda和输入的lambda一样吗     
    
end
if verbose ~= 0 disp('out QP'); end;

alphaall=zeros(size(e));   
alphaall(pos)=alpha;
obj=-0.5*alphaall'*H*alphaall +e'*alphaall;

if ~isempty(x)
    xsup = x(pos,:);
else
    xsup=[];
end;

ysup = y(pos);



w = (alpha.*ysup);
d = lambda;

if verbose ~= 0  
    disp('max(alpha)') 
    fprintf(1,'%6.2f\n',max(alpha)) 
end 
