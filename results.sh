(
cd out && awk -F, '  
FILENAME == "iterations.csv" && NR > 1 { last_iter = $0 }  
FILENAME == "retry.csv" && NR > 1 { last_retry = $0 }  
FILENAME == "response-time.csv" && NR > 1 { last_resp = $0 }  
END {  
    # iterations.csv  
    split(last_iter, I)  
    tps = I[3]  
    txcount = I[2]  
    # retry.csv  
    split(last_retry, R)  
    retries = R[2]  
    retries_sec = R[3]  
    # response-time.csv  
    split(last_resp, P)  
    p50 = P[7]  
    p95 = P[9]  
    p99 = P[10]  
    p999 = P[11]  
    # calculate % retries/totaltx  
    percent = (txcount > 0 ? (retries/txcount*100) : 0)  
    # output summary  
    printf "TPS: %8d retries: %6d retries/s: %5.1f %% ret/txs: %5.3f percentiles: 50.0%%: %5.1f 95.0%%: %5.1f 99.0%%: %5.1f 99.9%%: %5.1f\n", tps, retries, retries_sec, percent, p50, p95, p99, p999  
}  
' iterations.csv retry.csv response-time.csv  
)
