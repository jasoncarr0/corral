use "../bundle"
use "../vcs"

trait CmdType
  fun requires_bundle(): Bool => true
  fun requires_no_bundle(): Bool => false

  fun ref apply(ctx: Context,
    project: Project,
    vcs_builder: VCSBuilder,
    results_receiver: CmdResultReceiver)
