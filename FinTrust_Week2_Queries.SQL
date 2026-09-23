USE FinTrust_Bank;

-- Portfolio Overview: Total Customers, Total Transactions, Total Revenue, Avg Amount
SELECT 
    COUNT(DISTINCT c.[Customer_ID]) AS Total_Customers,
    COUNT(t.[Transaction_ID]) AS Total_Transactions,
    SUM(t.[Amount_NGN]) AS Total_Revenue_NGN,
    AVG(t.[Amount_NGN]) AS Average_Transaction_NGN
FROM dbo.[FINTRUST TRANSACTION DATA] c
LEFT JOIN dbo.[FINTRUST CUSTOMER DATA] t 
    ON c.[Customer_ID] = t.[Customer_ID];

    USE FinTrust_Bank;

-- Revenue and Transaction Breakdown by Customer Segment
SELECT 
    c.[Customer_Segment],
    COUNT(DISTINCT c.[Customer_ID]) AS Total_Customers,
    COUNT(t.[Transaction_ID]) AS Total_Transactions,
    SUM(t.[Amount_NGN]) AS Total_Revenue_NGN,
    AVG(t.[Amount_NGN]) AS Avg_Transaction_NGN
FROM dbo.[FINTRUST TRANSACTION DATA] c
LEFT JOIN dbo.[FINTRUST CUSTOMER DATA] t 
    ON c.[Customer_ID] = t.[Customer_ID]
GROUP BY c.[Customer_Segment]
ORDER BY Total_Revenue_NGN DESC;


USE FinTrust_Bank;

-- Transaction Volume & Revenue by Channel and Type
SELECT 
    t.[Channel],
    t.[Transaction_Type],
    COUNT(t.[Transaction_ID]) AS Transaction_Count,
    SUM(t.[Amount_NGN]) AS Total_Amount_NGN,
    AVG(t.[Amount_NGN]) AS Avg_Amount_NGN
FROM dbo.[FINTRUST CUSTOMER DATA] t
GROUP BY t.[Channel], t.[Transaction_Type]
ORDER BY Total_Amount_NGN DESC;

USE FinTrust_Bank;

-- Risk & International Transaction Breakdown
SELECT 
    t.[International_Transaction],
    t.[Risk_Review_Flag],
    COUNT(t.[Transaction_ID]) AS Total_Transactions,
    SUM(t.[Amount_NGN]) AS Total_Amount_NGN,
    AVG(t.[Amount_NGN]) AS Avg_Amount_NGN
FROM dbo.[FINTRUST CUSTOMER DATA] t
GROUP BY t.[International_Transaction], t.[Risk_Review_Flag]
ORDER BY Total_Transactions DESC;