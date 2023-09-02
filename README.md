# Browser Macros

Set od Python scripts used to test web browsers. It currently consists of these tests:

1. Forum
    - Tests basic web browsing using the [milanfon.cz] community forum. 
    - Loads selected pages and scrolls on them.
2. Tab
    - Opens 200 tabs in browser.
    - Loops between designated pages.
    - Uses basic keyboard shortcuts every browser has.

## Processing script

We used the HWiNFO64 CSV logging to get power consumption and RAM usage. Included Julia script is used to process the CSV output. 

Usage:
```julia
julia process.jl <input.csv>
```

__The script depends on Czech locale of HWiNFO64, in case of using another language, please change names of columns.__
