module AdminHelper
  
  def pages_label(label)
    res = PAGE_LABELS.detect{|l| l[1] == label}
    res.present? ? ret = res[0] : "Brak etykiety"
    return ret
  end

  
  def gallery_label(label)
    res = GALLERY_LABELS.detect{|l| l[1] == label}
    res.present? ? ret = res[0] : "Brak etykiety"
    return ret
  end

  def price_label(label)
    res = PRICE_LABELS.detect{|l| l[1] == label}
    res.present? ? ret = res[0] : "Brak etykiety"
    return ret
  end

end
