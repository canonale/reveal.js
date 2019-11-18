s;<table>;<table class="table">;g

/<!--/s;<!--[^<]*\(</\?div[^>]*>\).*-->;\1;g

/<img .*title="[^"].*class=&quot/s; class=&quot\;\([^&]\+\)&quot\;";" class="\1";g

/<p>Note:/ {
    s;<p>Note: ;<aside class="notes">;g
    s;</p>;</aside>;g
}
