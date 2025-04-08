/*SJF Algorithm*/
#include<stdio.h>
#define max 20
void main()
{
    int at[max],bt[max],tt[max],ft[max],wt[max],tat[max],i,j,n,temp1,temp2,x=0,y=0,z=0,min=0,k,l;
    float t,u;
    printf("Enter number of Processors to be executed:\n");
    scanf("%d",&n);
    printf("Enter arrival times:\n");
    for(i=0;i<n;i++)
    {
        printf("Enter the burst time for process-%d\n",i);
        scanf("%d",&bt[i]);
        printf("Enter the arrival time for process-%d\n",i);
        scanf("%d",&at[i]);
    }
    for(i=0;i<n;i++)
    {
        for(j=i+1;j<n;j++)
        {
        if(at[i]>at[j])
        {
            temp1=at[i];
            at[i]=at[j];
            at[j]=temp1;
            temp2=bt[i];
            bt[i]=bt[j];
            bt[j]=temp2;

        }
        else if(at[i]==at[j] && bt[i]>bt[j])
        {
            temp1=at[i];
            at[i]=at[j];
            at[j]=temp1;
            temp2=bt[i];
            bt[i]=bt[j];
            bt[j]=temp2;
            }
        }
    }
    for(i=1;i<=n;i++)
    {
        min=min+bt[i];
        for(j=j+1;at[j]<=min;j++)
        {
            for(k=j+1;at[k]<=min;k++)
            {
                if(bt[k]<bt[j])
                {
                    temp1=bt[k];
                    bt[k]=bt[j];
                    bt[j]=temp1;
                    temp2=at[k];
                    at[k]=at[j];
                    at[j]=temp2;
                }
            }
        }
    }

    for(i=0;i<n;i++)
    {
        x=x+bt[i];
        ft[i]=x;
        if(i==1)
        wt[i]=y;
        else
        {
            wt[i]=ft[i-1]-at[i];
            tat[i]=bt[i]+wt[i];
        }
    }
    for(i=0;i<n;i++)
    {
        y=y+tat[i];
        z=z+wt[i];
    }
    for(i=1;i<=n;i++)
    {
    printf("\nProcess:%d-->at:%d\t bt:%d\t ft:%d\ twt:%d\t tat:%d",i,at[i],bt[i],ft[i],wt[i],tat[i]);
    printf("\nAverage waiting time:%f",(float)z/n);
    printf("\nAverage tat time:%f",(float)y/n);
    }

    }
