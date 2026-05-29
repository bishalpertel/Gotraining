Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $isQuestion = $HeyBob.EndsWith("?")
    $containsQuestion = $HeyBob.Contains("?")
    $isYelling = $HeyBob.ToUpper() -ceq $HeyBob
    $isAlpha = $HeyBob -match "[a-zA-Z]"
    $isEmptyOrWhitespace = (([System.String]::IsNullOrWhiteSpace($HeyBob) -eq $HeyBob) -or ([System.String]::Empty -eq $HeyBob))
    $hasTrailingWhitespace = $HeyBob.EndsWith(" ")
    if ($isYelling -and $isQuestion -and $isAlpha) {
        return "Calm down, I know what I'm doing!"
    } elseif ($isYelling -and $isAlpha) {
        return "Whoa, chill out!"
    } elseif (($isQuestion -or ($containsQuestion -and $hasTrailingWhitespace))) { 
        return "Sure."
    } elseif ($isEmptyOrWhitespace) { 
        return "Fine. Be that way!"
    } else {
        return "Whatever."
    }

}
