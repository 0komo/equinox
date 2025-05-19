import std/[os, logging]
import pkg/[
  owlkettle,
  owlkettle/adw
]

viewable X11Warning:
  _: pointer # We don't even need this...

method view*(state: X11WarningState): Widget =
  result = gui:
    Window:
      title = "Equinox"
      defaultSize = (550, 760)

      AdwHeaderBar {.addTitlebar.}:
        showTitle = true
        style = HeaderBarFlat
        showTitle = true
        windowControls = (@[WindowControlIcon], @[WindowControlClose])
      
      Clamp:
        maximumSize = 500
        margin = 12

        Box:
          orient = OrientY

          Box {.hAlign: AlignCenter, vAlign: AlignCenter.}:
            Icon:
              name = "zoom-out-symbolic"
              pixelSize = 200

          Box {.hAlign: AlignCenter, vAlign: AlignCenter.}:
            Label:
              text = "<span size=\"large\"><b>Equinox does not support X11 right now. Please use a Wayland session instead.</b></span>"
              style = [StyleClass("notice-label")]
              useMarkup = true
              margin = 24

proc runX11Notice*() =
  info "gui: haha look at this X11 using distrotube worshipping nerd"
  adw.brew(
    gui(X11Warning())
  )
