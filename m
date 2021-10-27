Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465143D2E3
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 22:34:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 49489204BC; Wed, 27 Oct 2021 20:34:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 20:34:16 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CB7B420075
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 20:16:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q6YYSKgJBsa2 for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 20:16:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd35.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5E114200F2
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 20:16:25 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id g8so3936303iob.10
        for <nbd@other.debian.org>; Wed, 27 Oct 2021 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=LjqtuKqFcXICmEO8DHfW9oWVMqViCZUkTv+u2qOQRJE=;
        b=KuMjthfzFhs0jK3AOFpblR8xZlZVm6q0z4TLSnjUhqXDXOi4Ll6dDA2+z6kI+9lIYa
         w5P2ygcPS4qczrFtKPmS7Ccg4ws2sZpgU26vVHDpHsS8/uOcARKoqvAxOEUM/hbqiHaK
         zhEzcjDMEOZhMNyCQLQCK0YCLJwL9q0v6xK5BynD6Y6gSFi+noyloZUHcltMIac7N9Fq
         XTELJqnhHRsSs4NTmmZkKQ8kGQyqA7+O9hqu0dZ7Ncho0W+bOpvSwg8oly13QvVjJsiq
         s4win3Lo+0ss2ww17hLS4GwWuO28c+/ewZMhfksh0fuXQC86RNsY9yt6UvmIs5zGieHX
         4xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=LjqtuKqFcXICmEO8DHfW9oWVMqViCZUkTv+u2qOQRJE=;
        b=fYxXIS0CCe+dbJnfvj+YnNXImtNpJZ3Ts3k73yjXxtdSNR5EBRncqgJXAjAdiAgwBe
         903ZGp69oDhAeCS+/X0V0h8dzmnuqAAJBLMVdeCXWu/GajPVF+icNH+McidnFUis48yq
         0FGu1SQdx7VPyuPJr6YOwNYJ1YZyqRABU1Ip3g54eQqSbAYRLwnc9MqSwWWb456+f0cz
         x0ULGbR/zbCLZ/rcfEwJt6cTdv5Px3zmWV3wQrmWeHdj+hn8H/iov8N1T1RnZ5UbmKLD
         tLBc4HcGT0y3sprqwzrC09xiA3FrOY/PcA91/P46d4+oPec22snLf6o207a0b/NutCZi
         +8lA==
X-Gm-Message-State: AOAM533XKDtYTSnh+wO/texwBywqHARjcgWQdjz1VPf1GbxUJ2rSljhV
	hlgl7Wk0FUUPdhwbGgx59sncFA==
X-Google-Smtp-Source: ABdhPJzjKGWTU7Qj+ZS/+X6wIjVKvNDsihkCZ+0ht8OW7V4lQgdI5hSbFvSWgvIzOVN/9L+2pQ/5LQ==
X-Received: by 2002:a02:8484:: with SMTP id f4mr15430jai.140.1635365782499;
        Wed, 27 Oct 2021 13:16:22 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id j15sm513419ile.65.2021.10.27.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 13:16:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: kwolf@redhat.com, hch@lst.de, stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com, Xie Yongji <xieyongji@bytedance.com>, josef@toxicpanda.com
Cc: virtualization@lists.linux-foundation.org, nbd@other.debian.org, linux-block@vger.kernel.org
In-Reply-To: <20211026144015.188-1-xieyongji@bytedance.com>
References: <20211026144015.188-1-xieyongji@bytedance.com>
Subject: Re: [PATCH v3 0/4] Add blk_validate_block_size() helper for drivers to validate block size
Message-Id: <163536578184.77381.1471415825529034425.b4-ty@kernel.dk>
Date: Wed, 27 Oct 2021 14:16:21 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KUBBr_6ViEN.A.l8H.IfbehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1586
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/163536578184.77381.1471415825529034425.b4-ty@kernel.dk
Resent-Date: Wed, 27 Oct 2021 20:34:16 +0000 (UTC)

On Tue, 26 Oct 2021 22:40:11 +0800, Xie Yongji wrote:
> The block layer can't support the block size larger than
> page size yet, so driver needs to validate the block size
> before setting it. Now this validation is done in device drivers
> with some duplicated codes. This series tries to add a block
> layer helper for it and makes loop driver, nbd driver and
> virtio-blk driver use it.
> 
> [...]

Applied, thanks!

[1/4] block: Add a helper to validate the block size
      commit: 570b1cac477643cbf01a45fa5d018430a1fddbce
[2/4] nbd: Use blk_validate_block_size() to validate block size
      commit: c4318d6cd038472d13e08a54a9035863c8c160bd
[3/4] loop: Use blk_validate_block_size() to validate block size
      commit: af3c570fb0df422b4906ebd11c1bf363d89961d5
[4/4] virtio-blk: Use blk_validate_block_size() to validate block size
      commit: 57a13a5b8157d9a8606490aaa1b805bafe6c37e1

Best regards,
-- 
Jens Axboe


