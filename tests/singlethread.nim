# Works both with --threads:off and --threads:on

import syslog

proc logAll() =
  debug("Debug")
  info("Info")
  notice("Notice")
  warning("Warning")
  warn("Warn")
  error("Error")
  crit("Crit")
  alert("Alert")
  emerg("Emerg")

openlog("singlethread", logUser)
logAll()
let prev = setlogmask({ logDebug, logEmerg })
logAll()
discard setlogmask(prev)
logAll()
closelog()

