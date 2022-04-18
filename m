Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADA2505484
	for <lists+nbd@lfdr.de>; Mon, 18 Apr 2022 15:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2DE6720309; Mon, 18 Apr 2022 13:12:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 18 13:12:10 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D93420356
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Apr 2022 12:54:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1G_MH_AAIFAy for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Apr 2022 12:54:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x102c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 837AD203AE
	for <nbd@other.debian.org>; Mon, 18 Apr 2022 12:54:36 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id u5-20020a17090a6a8500b001d0b95031ebso7027626pjj.3
        for <nbd@other.debian.org>; Mon, 18 Apr 2022 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=ibYDSZCFNyFY0E0xngH81UyJF82hqCghGqnVPLy+gv8=;
        b=vC9VRENF/75LZHQO0Jmt6CUkAae3UjBfTPuDF0tWoqRTCDRZmo8HfD5ThHskhG+ttd
         Pb4E+Bm8QkdesdnIeSUdCK0uTkYqY4EnO/E1XMMjnuAqCu8yWkQwiUuJ9iY7ud95Qnx2
         f4SAdRo1cPQ2v3F2of3hIt+cb3rwD0EvWYnpV4vtuTAOdzLWk1UhZp7MoSZKC/MTbU54
         H7bg8uAIF3bvuEK9uekwY4wA2SP3L/0PtDSMZgN9cSVOjSc+1aVt3UCnot+lS/TQ7xf6
         viy8udDRKQitduBgLgFLGKJW/11xcZ6Ynd9P13N6I8H5rWnZ4vXdqSck8zAfPM7m3Rys
         vxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=ibYDSZCFNyFY0E0xngH81UyJF82hqCghGqnVPLy+gv8=;
        b=FP8fgL8bbHhAq5NzidBVezJ1dQDmQmAVRCTx1oBX22SpX6iXcGw44DrvJkt5tgylv/
         PuCXlpzfOyg9Y1AuxRFKu2rvrh9L5SVepN1Vy6izk/3k9445rLDbTfIOuEwo1zOZluca
         0nV/I4HYswtQALDEC+9Udfif0Uc9QQcO2m9vauN44XaXicfyVSE7SlPwzWtP+vhvFX6c
         2OAPgKoDyaZerr5hvWGPlSepHlxpWyGiY9Wc+BPegypYvtWQaQ/2nbgYDEvRTZN/Lp9M
         2AJEbc/cm08HqZwSnntGcOqKLVbl2fN+wFOHMUgKTVBM9+x+WnTTQMg7q5lEM5H0poDe
         ol/Q==
X-Gm-Message-State: AOAM533IubPT4SiXDCvDjvddIop+uhL882aXN44hwi4OLRniatkX/S5o
	OnHoRoZCk+khX6AFkM4YBWeINQ==
X-Google-Smtp-Source: ABdhPJz27Q2KH3dc6+wcyn8Fer81Q/YsmmGcpXrAJWb3QGquOeH4hUXGRnhuHPecX23uf799lbv9Aw==
X-Received: by 2002:a17:90a:6c64:b0:1cb:a150:52d with SMTP id x91-20020a17090a6c6400b001cba150052dmr12926639pjj.111.1650286472739;
        Mon, 18 Apr 2022 05:54:32 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id k7-20020aa788c7000000b0050a553bcf80sm8667087pff.18.2022.04.18.05.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:54:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: minchan@kernel.org, josef@toxicpanda.com, ngupta@vflare.org, Christoph Hellwig <hch@lst.de>
Cc: mcroce@microsoft.com, linux-block@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, nbd@other.debian.org, jack@suse.cz, djwong@kernel.org, ming.lei@redhat.com
In-Reply-To: <20220330052917.2566582-2-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de> <20220330052917.2566582-2-hch@lst.de>
Subject: Re: [PATCH 01/15] nbd: use the correct block_device in nbd_bdev_reset
Message-Id: <165028647141.16008.13343182404375254679.b4-ty@kernel.dk>
Date: Mon, 18 Apr 2022 06:54:31 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rPj3w3jLwxF.A.jaD.qOWXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2037
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/165028647141.16008.13343182404375254679.b4-ty@kernel.dk
Resent-Date: Mon, 18 Apr 2022 13:12:10 +0000 (UTC)

On Wed, 30 Mar 2022 07:29:03 +0200, Christoph Hellwig wrote:
> The bdev parameter to ->ioctl contains the block device that the ioctl
> is called on, which can be the partition.  But the openers check in
> nbd_bdev_reset really needs to check use the whole device, so switch to
> using that.
> 
> 

Applied, thanks!

[01/15] nbd: use the correct block_device in nbd_bdev_reset
        commit: 2a852a693f8839bb877fc731ffbc9ece3a9c16d7
[02/15] zram: cleanup reset_store
        commit: d666e20e2e7983d03bbf5e208b8485541ae616a1
[03/15] zram: cleanup zram_remove
        commit: 7a86d6dc1493326feb0d3ce5af2f34401dd3defa
[04/15] block: add a disk_openers helper
        commit: dbdc1be32591af023db2812706f01e6cd2f42bfc
[05/15] block: turn bdev->bd_openers into an atomic_t
        commit: 9acf381f3e8f715175c29f4b6d722f6b6797d139
[06/15] loop: de-duplicate the idle worker freeing code
        commit: 2cf429b53c1041a0e90943e1d2a5a7a7f89accb0
[07/15] loop: initialize the worker tracking fields once
        commit: b15ed54694fbba714931dd81790f86797cf8bed2
[08/15] loop: remove the racy bd_inode->i_mapping->nrpages asserts
        commit: 98ded54a33839e7b8f8bed772e01a544f48e33a7
[09/15] loop: don't freeze the queue in lo_release
        commit: 46dc967445bde5300eee7e567a67796de2217586
[10/15] loop: only freeze the queue in __loop_clr_fd when needed
        commit: 1fe0b1acb14dd3113b7dc975a118cd7f08af8316
[11/15] loop: implement ->free_disk
        commit: d2c7f56f8b5256d57f9e3fc7794c31361d43bdd9
[12/15] loop: suppress uevents while reconfiguring the device
        commit: 498ef5c777d9c89693b70cc453b40c392120ea1b
[13/15] loop: avoid loop_validate_mutex/lo_mutex in ->release
        commit: 158eaeba4b8edf9940f64daa83cbd1ac7db7593c
[14/15] loop: remove lo_refcount and avoid lo_mutex in ->open / ->release
        commit: a0e286b6a5b61d4da01bdf865071c4da417046d6
[15/15] loop: don't destroy lo->workqueue in __loop_clr_fd
        commit: d292dc80686aeafc418d809b4f9598578a7f294f

Best regards,
-- 
Jens Axboe


