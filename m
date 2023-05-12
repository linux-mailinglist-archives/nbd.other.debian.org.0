Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400B700B94
	for <lists+nbd@lfdr.de>; Fri, 12 May 2023 17:27:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D3532049D; Fri, 12 May 2023 15:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 12 15:27:11 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2757A20454
	for <lists-other-nbd@bendel.debian.org>; Fri, 12 May 2023 15:09:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id osSpzgcFVmsq for <lists-other-nbd@bendel.debian.org>;
	Fri, 12 May 2023 15:09:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0DE5820457
	for <nbd@other.debian.org>; Fri, 12 May 2023 15:09:38 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-760dff4b701so59896539f.0
        for <nbd@other.debian.org>; Fri, 12 May 2023 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1683904175; x=1686496175;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCibvLLxmrwwjTg8tqAHybrQHxUO9Q8BGBSAxnFXhiw=;
        b=uQb+J4jzLKUfp8gagw5cGFiAeUpcv8jZJp1GHPpWmpH5ipBA16smx4xIf5dXo0kFt+
         8GFco37b1QZVTDLsrUc59o0pmGTqqi+/Qpf+QglCqnMTKQ7ve0Au+qGHWiu40eqcmuXq
         tRZZ+RomkmcHetSB4F4Ten7NhzlmLnvX+ZH5m5DO/LRzSGQqwgNL/qweq2O67gzIGqjc
         MiJgfs9oBjCHf6V3c9KE9H5PsHE6lUMNVV2lUxN9lnfahQMHEBGRb3KV40k7a+9VIaC+
         B+AiDPgnY2JO6kEjuOgTgw3z+ikAybLXCLo3kEg3OrtP/hEreqnZzhzWQbgqssBrkyKF
         0/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683904175; x=1686496175;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCibvLLxmrwwjTg8tqAHybrQHxUO9Q8BGBSAxnFXhiw=;
        b=jSpCu28J//11fAuTgypzXIqsYxhEDirmOryqcBsyGvR2xfAsO8T/TXbDFig79Ofg0Q
         fvhzeFm7PIRnalCrnM83BIsxBE7D3w5cpDhlzf9r0vEJo0oIm+0BmAvBgCHf75u8YR4b
         vr/6rmom8Yk92V58FM+BuW083Fu56qB8eIp8X+c2RJd5MgtwtkGFTVuOihsi+D3XBX+t
         LZ1yLdVoJZbMUqzzWUaYztGPWcHwlwH2Fj/1eV/DmPtykPXVHsUYlnxI604x3TGkJEcA
         +MS4nE7nI4Hwm5vxdlcuiFSJ5INAQcMsO3wugYPMJ1gt8H91a1YWVDTTUNKKvxK82PSD
         HWpA==
X-Gm-Message-State: AC+VfDySz4StiKgCWtn1z6IR+CIm1hunZ99CAmJg81puq7G9Cq5cpmSx
	i6hmlsxJRl5xTLrRBnv2Hzya7Q==
X-Google-Smtp-Source: ACHHUZ4C6nUSwzXyYsE0c9Gh7gS2xy8BK1Q/t0KdbEpeZZJd9wlQic8dUm6KTp4fKwUEmUvC3d6cQQ==
X-Received: by 2002:a05:6602:2b93:b0:76c:8a4c:ad79 with SMTP id r19-20020a0566022b9300b0076c8a4cad79mr2715877iov.1.1683904175386;
        Fri, 12 May 2023 08:09:35 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id u21-20020a6be315000000b0076c6f5b8db5sm1685542ioc.16.2023.05.12.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 08:09:34 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 himadrispandya@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
References: <20230512130533.98709-1-ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] nbd: Fix debugfs_create_dir error checking
Message-Id: <168390417460.869582.2878039069012872149.b4-ty@kernel.dk>
Date: Fri, 12 May 2023 09:09:34 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vpMjQQA6ThL.A.DeC.PrlXkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2466
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168390417460.869582.2878039069012872149.b4-ty@kernel.dk
Resent-Date: Fri, 12 May 2023 15:27:12 +0000 (UTC)


On Fri, 12 May 2023 17:05:32 +0400, Ivan Orlov wrote:
> The debugfs_create_dir function returns ERR_PTR in case of error, and the
> only correct way to check if an error occurred is 'IS_ERR' inline function.
> This patch will replace the null-comparison with IS_ERR.
> 
> 

Applied, thanks!

[1/1] nbd: Fix debugfs_create_dir error checking
      commit: 4913cfcf014c95f0437db2df1734472fd3e15098

Best regards,
-- 
Jens Axboe



