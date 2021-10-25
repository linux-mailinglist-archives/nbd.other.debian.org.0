Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187A439D56
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 19:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 023A2204F9; Mon, 25 Oct 2021 17:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 17:18:09 2021
Old-Return-Path: <mst@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ED61620634
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 17:02:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YItGvGbH0wzl for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 17:02:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 89E862049C
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635181317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iOqztots9uZKwSQu0h1UICZOLJs0OYqyRoPLyAIfYPU=;
	b=M/TmRo0EJnQcNtwYgRQb/90sZExbbrSKF3jmIBzaBpl/kh/pw2at5F55TUksn8/UGA8NWa
	TRIDkfk/i8eA+v89pvqae4TDgWLxA5FwT0pEaDg0FK6DC2HRd0rPfGYkf8FsQ3XhMngpDO
	vbTOaSFknbaG3VxzEII7yXB/BzuBBZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-XrTs7qagPYazN-3V5XSaCA-1; Mon, 25 Oct 2021 13:01:55 -0400
X-MC-Unique: XrTs7qagPYazN-3V5XSaCA-1
Received: by mail-wm1-f71.google.com with SMTP id b79-20020a1c1b52000000b0032328337393so201408wmb.1
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 10:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iOqztots9uZKwSQu0h1UICZOLJs0OYqyRoPLyAIfYPU=;
        b=VKOtyeg8wpnzrJ5aNyXqkXzL8sC7edtnAg2uM3lpQ28mfK9Jtjxr7vrX15aGLYG4+i
         2/LA3w8CzVFN5RpsPPKADiUFlzMkSTvOCrEged/y9gJcc/NlA9Imlei4aMM/OgIVt9j0
         8cVo3qIYgEd8bYP63olyDuUEbIgWPhYj+EzVdpEvMwdlMav75O7QgenvU1q89vk8q/Zv
         uY0twAzkZytbTLwmK5cCZousRqatY7HALq6JEvJfFjXKhb1KBhSIcHbfh/uHC7QT+vCE
         2J44QfF2RAcw3YA2IV5Mw65MMpeKdFaw0d3WIsbj8Oroov1Ny7ed4xDrjA/ylmDp3nCH
         gFJw==
X-Gm-Message-State: AOAM532CAa5wGXF3hYjKjsCAOUejWMZJZasMvrQPSZq//8NrnHGmvWPO
	Hp0ohk40Z/qOdUjQEdEtf2z2eH3/fmkECrWGrarLh4uz4p07Po1bt4JqCaXfOvSwP8C4LyuTFTt
	7mRv4SeAjmSbtaw==
X-Received: by 2002:a05:600c:3511:: with SMTP id h17mr49729773wmq.144.1635181314586;
        Mon, 25 Oct 2021 10:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykMYYstKXiUf9n35P0ddmilxiuNYzTQRX70Dq1rRxHPfALd75DbAun/bZEPwwCibGSmSEIjA==
X-Received: by 2002:a05:600c:3511:: with SMTP id h17mr49729761wmq.144.1635181314388;
        Mon, 25 Oct 2021 10:01:54 -0700 (PDT)
Received: from redhat.com ([2.55.12.86])
        by smtp.gmail.com with ESMTPSA id u6sm11411331wmc.29.2021.10.25.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:01:53 -0700 (PDT)
Date: Mon, 25 Oct 2021 13:01:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: axboe@kernel.dk, hch@lst.de, josef@toxicpanda.com, jasowang@redhat.com,
	stefanha@redhat.com, kwolf@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 0/4] Add blk_validate_block_size() helper for drivers
 to validate block size
Message-ID: <20211025130130-mutt-send-email-mst@kernel.org>
References: <20211025142506.167-1-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211025142506.167-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RqQXlahBTGL.A.RgE.RbudhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1572
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025130130-mutt-send-email-mst@kernel.org
Resent-Date: Mon, 25 Oct 2021 17:18:10 +0000 (UTC)

On Mon, Oct 25, 2021 at 10:25:02PM +0800, Xie Yongji wrote:
> The block layer can't support the block size larger than
> page size yet, so driver needs to validate the block size
> before setting it. Now this validation is done in device drivers
> with some duplicated codes. This series tries to add a block
> layer helper for it and makes loop driver, nbd driver and
> virtio-blk driver use it.
> 
> V1 to V2:
> - Return and print error if validation fails in virtio-blk driver

Please document how all this was tested.

> Xie Yongji (4):
>   block: Add a helper to validate the block size
>   nbd: Use blk_validate_block_size() to validate block size
>   loop: Use blk_validate_block_size() to validate block size
>   virtio-blk: Use blk_validate_block_size() to validate block size
> 
>  drivers/block/loop.c       | 17 ++---------------
>  drivers/block/nbd.c        |  3 ++-
>  drivers/block/virtio_blk.c | 11 +++++++++--
>  include/linux/blkdev.h     |  8 ++++++++
>  4 files changed, 21 insertions(+), 18 deletions(-)
> 
> -- 
> 2.11.0

