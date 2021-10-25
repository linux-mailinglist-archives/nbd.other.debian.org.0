Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2743934C
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 12:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3BFC2054B; Mon, 25 Oct 2021 10:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 10:03:09 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D297420529
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 09:45:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fs5aRz6Jq1v5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 09:45:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1030.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4EB4020463
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 09:45:47 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso7981306pjb.1
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPD3abwHwXnuHqOkpauS6OSyWnIWVDUEQ3mrtmK8uvA=;
        b=oxsWgkuPavApcWBDAr8JzU4NKA7bwzmPbaQKXjKjUTHeBmbANPxD6kGxeCz8evoXuI
         MiIFaQlRC7tTIGroYg5u6RyTv24HoGEgc9ZAwsMEeGUikqyusonrpF8v87HMOEAzMcrw
         n4TewbhIq5BES24UPFR4ihl2EPFQ0sLinsOnqdcqPSToOGAenu4XGJQ6/tKLpAvN8Cvy
         z7dVTI47XOC43LcT852fSV6Wt1kAGdgC4oRwouDHCJP5OXO1UeKmghiYYwXJYsc6LwAM
         HEOsaj9j03pxnSONl37iOKeaLx63Xelt3tw/8NNaL/RMeCaxkN1LE2Ntjw0PbJExdWJK
         CCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPD3abwHwXnuHqOkpauS6OSyWnIWVDUEQ3mrtmK8uvA=;
        b=sDNp6BmdArTJeT8bgIcdnlUjGrbp5hyhHRr1ILV3ugZc6+GZbfRzdDz4gC8WJdruKS
         29IpUe1w7PswtX97/7cXWXsCXpiipULThg8HETKNJ+4jMjnr9CNgiBcfO7ruiohriv4u
         8733Uzd3K5lKuW2dQ+MkkstL1JSdfjjiS3YExg7LrbGjorDPc5ciY6kOUcYMYilyYAm9
         hPcAmXgWd9w28tsK6wgABgB4V0BMh2nOhsvF0+bcVRwbYFHch8HFjO4qEVicN5XT2Fs9
         9CjYKUDcVpwiRTGSL9k3RBtDbu0C3QQ1iUP8bQaE+WtxRMOh+ETrdapc3vt1CIfo5y9p
         6lZA==
X-Gm-Message-State: AOAM533cHwkTw0pVYx9k0xU8oMTbe3PIaXCgi2tuwl3wwrdOMxpGfKys
	VWLGXSlAqJmdWvy93WFe07jT
X-Google-Smtp-Source: ABdhPJxDcVzxvbwQ7LOszVdQOSXCMt3SRb+GDgq7Adixsg3NGvOdY5MKJ02q6bvNGyaFZxOaPXoOgA==
X-Received: by 2002:a17:90b:1d8e:: with SMTP id pf14mr19081276pjb.125.1635155144236;
        Mon, 25 Oct 2021 02:45:44 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id g11sm20050222pfc.194.2021.10.25.02.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 02:45:43 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	hch@lst.de,
	josef@toxicpanda.com,
	mst@redhat.com,
	jasowang@redhat.com,
	stefanha@redhat.com,
	kwolf@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 0/4] Add blk_validate_block_size() helper for drivers to validate block size
Date: Mon, 25 Oct 2021 17:43:02 +0800
Message-Id: <20211025094306.97-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hNJeOnkyr1G.A.0MB.dDodhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1561
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025094306.97-1-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 10:03:09 +0000 (UTC)

The block layer can't support the block size larger than
page size yet, so driver needs to validate the block size
before setting it. Now this validation is done in device drivers
with some duplicated codes. This series tries to add a block
layer helper for it and makes loop driver, nbd driver and
virtio-blk driver use it.

Xie Yongji (4):
  block: Add a helper to validate the block size
  nbd: Use blk_validate_block_size() to validate block size
  loop: Use blk_validate_block_size() to validate block size
  virtio-blk: Use blk_validate_block_size() to validate block size

 drivers/block/loop.c       | 17 ++---------------
 drivers/block/nbd.c        |  3 ++-
 drivers/block/virtio_blk.c |  7 +++++--
 include/linux/blkdev.h     |  8 ++++++++
 4 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.11.0

