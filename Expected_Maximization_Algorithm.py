"""
Expected maximization algorithm - coin toss example
Mike Sylvester MSDS 7333 1/10/2017
"""

est=10
iheads=[5,9,8,4,7]
itails=[5,1,2,6,3]

a_that=0.6
b_that=0.5

for num in range(10):
    
    a_sumheads=0; a_sumtails=0; b_sumheads=0; b_sumtails=0
    
    for i in range(len(iheads)):   
        
        nom=.5*(a_that**iheads[i]*(1-a_that)**(est-iheads[i]))
        dem=.5*((a_that**iheads[i]*(1-a_that)**(est-iheads[i]))+(b_that**iheads[i]*(1-b_that)**(est-iheads[i])))    
        a_coin=nom/dem
        
        b_coin=1-a_coin
        
        a_coinheads=a_coin*iheads[i]
        a_cointails=a_coin*itails[i]
        b_coinheads=b_coin*iheads[i]
        b_cointails=b_coin*itails[i]   
        
        a_sumheads=a_sumheads+a_coinheads
        a_sumtails=a_sumtails+a_cointails
    
        b_sumheads=b_sumheads+b_coinheads
        b_sumtails=b_sumtails+b_cointails    
        
        print 'Iteration ' + str(num) + '   ' + str(a_that) + ' ' + str(b_that)
        print iheads[i], itails[i], a_coin, b_coin, a_coinheads, a_cointails, b_coinheads, b_cointails       
        print ''
    
    a_that=a_sumheads/(a_sumheads+a_sumtails)
    b_that=b_sumheads/(b_sumheads+b_sumtails)
    
