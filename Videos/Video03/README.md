<pre><font color="#2AA1B3"><b>SLAE/Videos/Video03</b></font> on <font color="#A2734C"><b>☁️  (ap-southeast-1) </b></font>
<font color="#26A269"><b>❯</b></font> <font color="#12488B">lscpu</font>
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   8
  On-line CPU(s) list:    0-7
Vendor ID:                GenuineIntel
  Model name:             11th Gen Intel(R) Core(TM) i5-1155G7 @ 2.50GHz
    CPU family:           6
    Model:                140
    Thread(s) per core:   2
    Core(s) per socket:   4
    Socket(s):            1
    Stepping:             2
    CPU(s) scaling MHz:   25%
    CPU max MHz:          4500.0000
    CPU min MHz:          400.0000
    BogoMIPS:             4992.00
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse
                          36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb
                           rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo
                          logy nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64
                           monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
                           sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdr
                          and lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd ibrs
                           ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsg
                          sbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a avx512f avx51
                          2dq rdseed adx smap avx512ifma clflushopt clwb intel_pt avx512cd sha_
                          ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves split_lock_detect
                           user_shstk dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp
                          _epp hwp_pkg_req vnmi avx512vbmi umip pku ospke avx512_vbmi2 gfni vae
                          s vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid movdiri
                           movdir64b fsrm avx512_vp2intersect md_clear ibt flush_l1d arch_capab
                          ilities
Virtualization features:  
  Virtualization:         VT-x
Caches (sum of all):      
  L1d:                    192 KiB (4 instances)
  L1i:                    128 KiB (4 instances)
  L2:                     5 MiB (4 instances)
  L3:                     8 MiB (1 instance)
NUMA:                     
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-7
Vulnerabilities:          
  Gather data sampling:   Mitigation; Microcode
  Itlb multihit:          Not affected
  L1tf:                   Not affected
  Mds:                    Not affected
  Meltdown:               Not affected
  Mmio stale data:        Not affected
  Reg file data sampling: Not affected
  Retbleed:               Not affected
  Spec rstack overflow:   Not affected
  Spec store bypass:      Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:             Mitigation; Enhanced / Automatic IBRS; IBPB conditional; RSB filling;
                           PBRSB-eIBRS SW sequence; BHI SW loop, KVM SW loop
  Srbds:                  Not affected
  Tsx async abort:        Not affected

</pre>



cat /proc/cpuinfo


<pre><font color="#444444">───────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────</font>
       <font color="#444444">│ </font>File: <b>/proc/cpuinfo</b>
<font color="#444444">───────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────</font>
<font color="#444444">   1</font>   <font color="#444444">│</font> <font color="#F92672">processor   </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0</font>
<font color="#444444">   2</font>   <font color="#444444">│</font> <font color="#F92672">vendor_id   </font><font color="#F8F8F2">:</font><font color="#E6DB74"> GenuineIntel</font>
<font color="#444444">   3</font>   <font color="#444444">│</font> <font color="#F92672">cpu family  </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 6</font>
<font color="#444444">   4</font>   <font color="#444444">│</font> <font color="#F92672">model       </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 140</font>
<font color="#444444">   5</font>   <font color="#444444">│</font> <font color="#F92672">model name  </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 11th Gen Intel(R) Core(TM) i5-1155G7 @ 2.50GHz</font>
<font color="#444444">   6</font>   <font color="#444444">│</font> <font color="#F92672">stepping    </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 2</font>
<font color="#444444">   7</font>   <font color="#444444">│</font> <font color="#F92672">microcode   </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0x38</font>
<font color="#444444">   8</font>   <font color="#444444">│</font> <font color="#F92672">cpu MHz     </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 3963.837</font>
<font color="#444444">   9</font>   <font color="#444444">│</font> <font color="#F92672">cache size  </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 8192 KB</font>
<font color="#444444">  10</font>   <font color="#444444">│</font> <font color="#F92672">physical id </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0</font>
<font color="#444444">  11</font>   <font color="#444444">│</font> <font color="#F92672">siblings    </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 8</font>
<font color="#444444">  12</font>   <font color="#444444">│</font> <font color="#F92672">core id     </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0</font>
<font color="#444444">  13</font>   <font color="#444444">│</font> <font color="#F92672">cpu cores   </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 4</font>
<font color="#444444">  14</font>   <font color="#444444">│</font> <font color="#F92672">apicid      </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0</font>
<font color="#444444">  15</font>   <font color="#444444">│</font> <font color="#F92672">initial apicid  </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 0</font>
<font color="#444444">  16</font>   <font color="#444444">│</font> <font color="#F92672">fpu     </font><font color="#F8F8F2">:</font><font color="#E6DB74"> yes</font>
<font color="#444444">  17</font>   <font color="#444444">│</font> <font color="#F92672">fpu_exception   </font><font color="#F8F8F2">:</font><font color="#E6DB74"> yes</font>
<font color="#444444">  18</font>   <font color="#444444">│</font> <font color="#F92672">cpuid level </font><font color="#F8F8F2">:</font><font color="#E6DB74"> 27</font>
<font color="#444444">  19</font>   <font color="#444444">│</font> <font color="#F92672">wp      </font><font color="#F8F8F2">:</font><font color="#E6DB74"> yes</font>
<font color="#444444">  20</font>   <font color="#444444">│</font> <font color="#F92672">flags       </font><font color="#F8F8F2">:</font><font color="#E6DB74"> fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht t</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">m pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf t</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">sc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popc</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">nt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd ibrs ibpb stibp ibr</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">s_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a avx512f avx512dq r</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">dseed adx smap avx512ifma clflushopt clwb intel_pt avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves split_lock_d</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">etect user_shstk dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req vnmi avx512vbmi umip pku ospke avx512</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74">_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid movdiri movdir64b fsrm avx512_vp2intersect md_clear</font>
<font color="#444444">    </font>   <font color="#444444">│</font> <font color="#E6DB74"> ibt flush_l1d arch_capabilities</font>
:

</pre>



