Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B573693E37E
	for <lists+nbd@lfdr.de>; Sun, 28 Jul 2024 05:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6897620874; Sun, 28 Jul 2024 03:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul 28 03:18:10 2024
Old-Return-Path: <cipkuehl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B07292075D
	for <lists-other-nbd@bendel.debian.org>; Sun, 28 Jul 2024 03:02:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t0xCAWJwg4Gv for <lists-other-nbd@bendel.debian.org>;
	Sun, 28 Jul 2024 03:02:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5916C2074B
	for <nbd@other.debian.org>; Sun, 28 Jul 2024 03:02:51 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso1971581b3a.0
        for <nbd@other.debian.org>; Sat, 27 Jul 2024 20:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722135767; x=1722740567; darn=other.debian.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/gVcElNf+HMdnHzN0q7VOL/023eHLlj4iiCR143nEU=;
        b=L4zpUmYOvEpRCnW/i0FfydfuZah0GArbSM5MB4R69FP+IV0TAHImafsXt0p9x3aOo/
         S75S/fc7ToOdFmk29ndXJ5yJNYWwSIe9iiEI4EA1xA0znWNsHL8eImhtT4bSUWx6AxUs
         ufHkj3v/9Gz7RF/jbMmQN93f0mlvUjguHJZwYKWLeOQvLWvTGdBP9DUfrQy1Gq/VNj1D
         jXtugSfgQn+R60P7hwY3kM6m3EIhTU/Ww4YDSPM+NcvIW6gbPI/JpTUNaSj6w30qB2L/
         x8IKWRx5lFWaQSymBrpY9rmp0BDprm5536Bn1py2fEiaxEwEjr32pddJ6rNNIQphPVhI
         Yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722135767; x=1722740567;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/gVcElNf+HMdnHzN0q7VOL/023eHLlj4iiCR143nEU=;
        b=eqOwDwdAXxV5WMb59/F+FySzG+omwCri4OzBzGNdFgKreADbLx0GUtzZj3w6uI6nLv
         OICKFh5TtS2fH6wSu7fChThKovZUbeyfJ4jSKMyzdSkIHcf5rgQIY8Imgog81n0snFEC
         rK1URZcUdjnATfKUaUrwbPGTRPeeKQO+Gb3TRyfxOPOV9/Ymtcjo8GTUy713JkeKP2sB
         QakroaOABcSTZGhMzKA5NeuXooBc6DVPLN7KTJ4LCJxDbQbS4hcE/zLdhPLdnY9zM374
         VnUjB3LVWCdX/p/svFr/aWMke+3wOWvPYcpMyYsrJhd05/0AEfvD7DM4fnCMb7Qic0cP
         PtBA==
X-Gm-Message-State: AOJu0YzJ1qAiKKy5glWFK+b1R/xZgfJRSwttvPukcYB7WN1u11cFnrFB
	VAzTVpniksRN+roI/t4EM/oDZBfcHw6AIcX1LJLqN+t3EVF4Q3+xB1B9hw==
X-Google-Smtp-Source: AGHT+IHeHdRVpLmM9OmeMOEn1gci0phCfThjPP6qRca78dB0oxTavAnlrcW0E0s9BI3FTaQouRcP3A==
X-Received: by 2002:a05:6a00:1811:b0:6f8:e1c0:472f with SMTP id d2e1a72fcca58-70ecea11a32mr5142242b3a.8.1722135766707;
        Sat, 27 Jul 2024 20:02:46 -0700 (PDT)
Received: from smtpclient.apple ([50.53.88.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead89f003sm4747461b3a.190.2024.07.27.20.02.46
        for <nbd@other.debian.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2024 20:02:46 -0700 (PDT)
From: Connor Kuehl <cipkuehl@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Status flags definition for NBD_REPLY_TYPE_BLOCK_STATUS
Message-Id: <2B83C3DC-D923-4D9C-94C3-66336F41FB2E@gmail.com>
Date: Sat, 27 Jul 2024 20:02:35 -0700
To: nbd@other.debian.org
X-Mailer: Apple Mail (2.3774.600.62)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9mZdimtdffK.A.MOkG.yhbpmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3108
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2B83C3DC-D923-4D9C-94C3-66336F41FB2E@gmail.com
Resent-Date: Sun, 28 Jul 2024 03:18:10 +0000 (UTC)

Hello,

I am implementing the client-side of the NBD protocol and I've gotten
a little stuck on the NBD_REPLY_TYPE_BLOCK_STATUS structured reply.

The protocol description[1] states:

> * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)
> 
>   *length* MUST be 4 + (a positive integer multiple of 8).  This reply
>   represents a series of consecutive block descriptors where the sum
>   of the length fields within the descriptors is subject to further
>   constraints documented below.  A successful block status request MUST
>   have exactly one status chunk per negotiated metadata context ID.
> 
>   The payload starts with:
> 
>   32 bits, metadata context ID  
> 
>   and is followed by a list of one or more descriptors, each with this
>   layout:
> 
>   32 bits, length of the extent to which the status below
>      applies (unsigned, MUST be nonzero)  
>   32 bits, status flags  

I can't seem to find the definition for these status flags. It's likely
I may have just missed it. Any pointers will be much appreciated.

Thank you,

Connor

[1] https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md

