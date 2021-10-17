Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521243095D
	for <lists+nbd@lfdr.de>; Sun, 17 Oct 2021 15:27:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 422C920703; Sun, 17 Oct 2021 13:27:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Oct 17 13:27:23 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C9A99206EC
	for <lists-other-nbd@bendel.debian.org>; Sun, 17 Oct 2021 13:09:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ce273mNBTCzH for <lists-other-nbd@bendel.debian.org>;
	Sun, 17 Oct 2021 13:09:24 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x135.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EEB38206E7
	for <nbd@other.debian.org>; Sun, 17 Oct 2021 13:09:24 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id x1so12147443ilv.4
        for <nbd@other.debian.org>; Sun, 17 Oct 2021 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E9Jyn0+UnK3sc3mmvA7he3hRp8rjj2TT3D6AT72yd4M=;
        b=ASbJHIes5zFbIZLmT5kVad1Gphz/29iN5mRZeqZ3tlpfB2PUdfQDCYxs075KhC+NRv
         +usb2/LkAXg0fIeSB6mt8w9pH+E6c/OzEkv6tDGKbfXIFAQ8t5oyEn+o8Dm+lUJUNx5+
         Ul8uzxE52kgKEL4dvh9ifK8Bs7hDbeWzFDtGBQT9pQvuXKgTknQxbbEBf0BO1vBzF4qy
         L/DyRrQaJNeIc5GfM9JkFYQXD4eGf7eTOnQDguECYJz6ORTo/TEr2I9lvVJ6/rauXUJO
         VfwfWz2j/mdzCKbXt9/EaZfgdFsXIAT6UuwcRy3z9fFP2sHhYSEzdGkFLIglkDES37rW
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9Jyn0+UnK3sc3mmvA7he3hRp8rjj2TT3D6AT72yd4M=;
        b=xkwfosdx/1HDVYuKCr2fWQb8dyeTFyWzFi6EhCz+liCBxcz3NRb0GjMNfCWQqJpvuu
         3ZpqvCFa2fytl24HBCLzo80Vb36r6Oc6RhJ1ClhleFgyFSTOROt32JylFXsaqL7Flg43
         oh80H6YmjOKMtPdkvjxVGnsU/E6lMztfuiZlfL+Stu8mEcttykfXcjP6K/t3KOPKS3ln
         q3rQqLsYFJ6cmI/h2SEq1/A3KiQW8IViluTUkfmb7O6/w3yYaS4fo0LOOQghRnQeZ+YS
         3y3DPT1Rg0ZJO8cEpiwLM2wqMKSZtvenyot8fjFG30AsV88fxE6Z76oUyJ+oGefe2qYl
         ZvOg==
X-Gm-Message-State: AOAM533Yi9gOrQOJwINNast7ABKALmha4UJbqpLqba2sLe3KmC7eAUnY
	PCRjgK9ZPU1boOJap+S7dA5VxA==
X-Google-Smtp-Source: ABdhPJyBQfKmB09Bzd5teZfNePKIxWO5jVUrQL469Ya6l1IO9E9yjwNbDWiexPCRyhhuJXu+WSpsNw==
X-Received: by 2002:a92:c244:: with SMTP id k4mr11177912ilo.3.1634476161731;
        Sun, 17 Oct 2021 06:09:21 -0700 (PDT)
Received: from localhost.localdomain ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id h5sm2543282ili.12.2021.10.17.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 06:09:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Yu Kuai <yukuai3@huawei.com>,
	ming.lei@redhat.com,
	josef@toxicpanda.com
Cc: Jens Axboe <axboe@kernel.dk>,
	nbd@other.debian.org,
	yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH v9] nbd: fix uaf in nbd_handle_reply()
Date: Sun, 17 Oct 2021 07:09:16 -0600
Message-Id: <163447615283.94076.11299323774180750344.b4-ty@kernel.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20210916141810.2325276-1-yukuai3@huawei.com>
References: <20210916093350.1410403-8-yukuai3@huawei.com> <20210916141810.2325276-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tTCJQGJvBoK.A.gQE.7SCbhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1542
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163447615283.94076.11299323774180750344.b4-ty@kernel.dk
Resent-Date: Sun, 17 Oct 2021 13:27:23 +0000 (UTC)

On Thu, 16 Sep 2021 22:18:10 +0800, Yu Kuai wrote:
> There is a problem that nbd_handle_reply() might access freed request:
> 
> 1) At first, a normal io is submitted and completed with scheduler:
> 
> internel_tag = blk_mq_get_tag -> get tag from sched_tags
>  blk_mq_rq_ctx_init
>   sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
> ...
> blk_mq_get_driver_tag
>  __blk_mq_get_driver_tag -> get tag from tags
>  tags->rq[tag] = sched_tag->static_rq[internel_tag]
> 
> [...]

Applied, thanks!

[1/1] nbd: fix uaf in nbd_handle_reply()
      commit: 52c90e0184f67eecb00b53b79bfdf75e0274f8fd

Best regards,
-- 
Jens Axboe


