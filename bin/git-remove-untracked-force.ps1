git remote update --prune; git branch -vv | % { 
    $branch_line = $_.toString().Replace("*","").Trim(); 
    $branch_name = $branch_line.Replace("*","").Trim().Split(" ")[0]; 
    $has_origin = $branch_line.Contains("[origin/");
    $has_gone = $branch_line.Contains(": gone");
    if ($has_gone -or -not $has_origin) {
        git branch -D $branch_name;
    }
}