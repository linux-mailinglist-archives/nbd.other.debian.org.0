Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D24367C9
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 18:30:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8195201E3; Thu, 21 Oct 2021 16:30:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 16:30:21 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B9F492021C
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 16:12:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Yli58nnv1Krp for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 16:12:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-ot1-x336.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7EE7F2011F
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 16:12:52 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so1019709ote.8
        for <nbd@other.debian.org>; Thu, 21 Oct 2021 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=16KxnfD2EjRW7s67gQ2B1gfm7zayQWm3CwLWep3JjEM=;
        b=auDhun93u2KnRwyRu2Jxrnsl8kMD7dn8A6XhWDZfQiulJCbso5jyEFs4nKWw5HPyR4
         amQMp6e/7oxwkD1eVQUnPMk00ciPoqPhlCIPi3KY3l8hCFm0zwoWpPhusCRfm3Q/S1PD
         irdw+J+UgzuweQ2UnhRm+t/dL0huueUPfA4DIYAzxWAemo//pRRwI0a6Wp4QWNKVeJMH
         Dkiu+2yoKgDyoDyMdRPuBj9bQJwr6pCtiQhzb+VNYGnGaYmDIFkQ8sVnxlEbDrfFM6XN
         3R3IIMEuU3PojHvUpMPcqOTQkz1ubT13T/H3jH/il51+JahVT7r/YGtPwTHmQ3H8+9v/
         WaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=16KxnfD2EjRW7s67gQ2B1gfm7zayQWm3CwLWep3JjEM=;
        b=Eql1mzgSD7hynUk1lXkjDgYGk7CHx9Nc91/eDA0PQnfdzQ2vYvriVlBp2dDBgIWT/4
         10JAiJOkyMcEQsvMDEGRNjnmkARIy+VedeJ5AamylFaV3Q/MIEhn59xnh2L25oylf53h
         9yhYpJQbLB9Z8xHjbSQs/2I3is/lYB8wYvoM8SjWwEgzYhrD5gUelPr1Bz73clUVdDkT
         yEEepqd64EWj+PCyT98RqdXBbO2goK2QcOmFhKlKsp1wx630pL1I+g5z223QGxpcGvau
         Y5q2za+YcYuXTgKtY+IirDGuhNZrC73DyrRDgA5HNFp8dD3N319nVh/wJngRioHPLrTv
         d30Q==
X-Gm-Message-State: AOAM530KTdjXL/SIgvzmD2pd0u62agqtd2OfPyLaRxH4yw1PG+8C0NiJ
	wvHYSZUtdcn5+T++GEwPVfEAVw==
X-Google-Smtp-Source: ABdhPJx3ZysvSA9KzeDjxTDH5deMFC6mxVG8ziElQSLDD8csxNxondJD1QYJDrXyCNF2kicL+NAHhQ==
X-Received: by 2002:a05:6830:2424:: with SMTP id k4mr5474376ots.210.1634832769427;
        Thu, 21 Oct 2021 09:12:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:380:783a:c43c:af64:c142:4db7:63ac])
        by smtp.gmail.com with ESMTPSA id e59sm1176020ote.14.2021.10.21.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 09:12:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: hch@infradead.org, josef@toxicpanda.com, Xie Yongji <xieyongji@bytedance.com>
Cc: yixingchen@bytedance.com, linux-block@vger.kernel.org, nbd@other.debian.org
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
References: <20210922123711.187-1-xieyongji@bytedance.com>
Subject: Re: [PATCH v2 0/4] Add invalidate_disk() helper for drivers to invalidate the gendisk
Message-Id: <163483276867.63016.8699085778503440970.b4-ty@kernel.dk>
Date: Thu, 21 Oct 2021 10:12:48 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Zzud05PjAMC.A.j3D.dWZchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1559
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163483276867.63016.8699085778503440970.b4-ty@kernel.dk
Resent-Date: Thu, 21 Oct 2021 16:30:21 +0000 (UTC)

On Wed, 22 Sep 2021 20:37:07 +0800, Xie Yongji wrote:
> This series comes from Christoph Hellwig's suggestion [1]. Some block
> device drivers such as loop driver and nbd driver need to invalidate
> the gendisk when the backend is detached so that the gendisk can be
> reused by the new backend. Now the invalidation is done in device
> driver with their own ways. To avoid code duplication and hide
> some internals of the implementation, this series adds a block layer
> helper and makes both loop driver and nbd driver use it.
> 
> [...]

Applied, thanks!

[1/4] block: Add invalidate_disk() helper to invalidate the gendisk
      commit: f059a1d2e23a165bf86e33673c6a7535a08c6341
[2/4] loop: Use invalidate_disk() helper to invalidate gendisk
      commit: e515be8f3b3e63be4c5e91dc6620483ed0990a0c
[3/4] loop: Remove the unnecessary bdev checks and unused bdev variable
      commit: 19f553db2ac03cb8407ec8efb8e140951afdfb87
[4/4] nbd: Use invalidate_disk() helper on disconnect
      commit: 435c2acb307f19acc791b4295e29cc53a82bd24d

Best regards,
-- 
Jens Axboe


