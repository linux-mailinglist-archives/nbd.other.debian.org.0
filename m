Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5287F31C8
	for <lists+nbd@lfdr.de>; Tue, 21 Nov 2023 16:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 481E920A0A; Tue, 21 Nov 2023 15:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 21 15:00:13 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EA4BB209A1
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Nov 2023 14:42:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id avIZEM6Bk5ai for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Nov 2023 14:42:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A33142099F
	for <nbd@other.debian.org>; Tue, 21 Nov 2023 14:42:40 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7a950f1451fso53763739f.1
        for <nbd@other.debian.org>; Tue, 21 Nov 2023 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700577757; x=1701182557; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgSwU2wjmRzA6RzqAcEMU9EpGu84w83u/YmCrCrTRVc=;
        b=S5MtsO3OT/0e/mVk1x2EIQceVND6PiTGS7dzkhkoGFyJ4OJ8hkc9ikc8fbPmHLFmVG
         f5rAG21UUoWfn1KI3arX3k+fQoRF39NZFenNFhmpYJYhV64/SeNs6oieb07sTs23wR44
         zJaq+g4ZQzApWOx8/dUARu0ds34a7SDjgdS9zrAhtMfOGexMHGNtpVTwTJKcgjIrB8FV
         8Y6UBNgKo0+gsT6ozqW3LqP+EEPjmh78G7UYzNoW08euSasmH+Q6E7kieETk956yqsKx
         3wKUrXg/V5Gp7TsUQVg/YAizVYd5eUEqlnqtzzaa6CwK+xTWx0JLGR0jTLMMREZ09Wwd
         Ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577757; x=1701182557;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgSwU2wjmRzA6RzqAcEMU9EpGu84w83u/YmCrCrTRVc=;
        b=MiWbTmuwx3FWB/XXo840hs5eDTLwbg2WKqtnTrQp7xjVIeKkNaT3MwBa06jcf43+Yt
         QfAC5LLNxH+Wmh+BP6OLjX4gZl+UzwgpPX7bJRXPl7/sk4age95c1lL7EsZRqsrnkVMp
         T0CFiJl87iW+iFReOM565yZ8z5FD/BQLvRkEvDdq7OQsiHXLA/3hYFonfgANJPNIsXBg
         0Ut6NaZQm1iPurXFsWfmDqOHGCyGy7KDpHBg8CHYlcfbxwzYKL0F+97qAZd0tEB0xTnn
         fyo25/w066c6gJy3L35ATvKKCgKsGGx0TF3/KO/62mU0SgJcIoEFi8KvO3N0VwyFyyAJ
         +aLQ==
X-Gm-Message-State: AOJu0Yx6r2yNnzJNLwBqKd9rWfdU0DcGuWHHClIIuktYxd7Qa1Ao5/dx
	T2aCOKNgP0X9r4Gj2kJLEoRgxQ==
X-Google-Smtp-Source: AGHT+IEEmIAZAYZgOvVGMKlcTAnQdAbmk+xo/5J9j5adJQMyuSUcAXy3WQ87OhmLmjTMwEB7mBPsrg==
X-Received: by 2002:a5d:9b92:0:b0:7b0:acce:5535 with SMTP id r18-20020a5d9b92000000b007b0acce5535mr7649795iom.1.1700577757029;
        Tue, 21 Nov 2023 06:42:37 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id j14-20020a02cb0e000000b004665ad49d39sm1187305jap.74.2023.11.21.06.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:42:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, linan666@huaweicloud.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, linan122@huawei.com, yukuai3@huawei.com, 
 yi.zhang@huawei.com, houtao1@huawei.com, yangerkun@huawei.com
In-Reply-To: <20230911023308.3467802-1-linan666@huaweicloud.com>
References: <20230911023308.3467802-1-linan666@huaweicloud.com>
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of
 index
Message-Id: <170057775563.269185.521615863055260084.b4-ty@kernel.dk>
Date: Tue, 21 Nov 2023 07:42:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-26615
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UAV02geLr7P.A.ziF.9XMXlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2678
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170057775563.269185.521615863055260084.b4-ty@kernel.dk
Resent-Date: Tue, 21 Nov 2023 15:00:13 +0000 (UTC)


On Mon, 11 Sep 2023 10:33:08 +0800, linan666@huaweicloud.com wrote:
> If a socket is processing ioctl 'NBD_SET_SOCK', config->socks might be
> krealloc in nbd_add_socket(), and a garbage request is received now, a UAF
> may occurs.
> 
>   T1
>   nbd_ioctl
>    __nbd_ioctl
>     nbd_add_socket
>      blk_mq_freeze_queue
> 				T2
>   				recv_work
>   				 nbd_read_reply
>   				  sock_xmit
>      krealloc config->socks
> 				   def config->socks
> 
> [...]

Applied, thanks!

[1/1] nbd: pass nbd_sock to nbd_read_reply() instead of index
      commit: 98c598afc22d4e43c2ad91860b65996d0c099a5d

Best regards,
-- 
Jens Axboe



