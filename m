Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74ACCD07C
	for <lists+nbd@lfdr.de>; Thu, 18 Dec 2025 18:54:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 29B7020672; Thu, 18 Dec 2025 17:54:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 18 17:54:11 2025
Old-Return-Path: <justintee8345@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DCF8D20670
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Dec 2025 17:36:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rXUefTpWjS0E for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Dec 2025 17:36:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-qv1-xf2a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 222CB20666
	for <nbd@other.debian.org>; Thu, 18 Dec 2025 17:36:00 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88a35a00506so12549366d6.2
        for <nbd@other.debian.org>; Thu, 18 Dec 2025 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766079358; x=1766684158; darn=other.debian.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Km2T1I5YBUewLvu5wzssTsrcMP7r1tKGG8gU9jwLlQI=;
        b=dFxQFbytUCh62Ug6YgYPln+MQ2txXcWdaPgUKetdYZ7zyCBWzoGYhczr1bQVaYQq9/
         9z8xbnmbOjRxgE5haxkXeiFnw1JNcdwGriFvwycA51sNzTgAo46wrlOOyPiAg3bDXw/I
         b5AuP8j3f/blVMzfIm6QRdZzca/p4zEoLpDbIGlqoiMP1cPND3qHQv5drUS0jvuO51jI
         3k+HQWgvlJhR7SNidsCVPPGzb0Hl7dBc3FoklV/QD0VJ6ihc/3KnZYHtz3nABY2xiU37
         FvJsCfnkzVIj6qZrIV3PLA3zpbgcXahAnb/qxLKzAwC1ebPvwDxcwY1zWkQyz0eefDeG
         OOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766079358; x=1766684158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Km2T1I5YBUewLvu5wzssTsrcMP7r1tKGG8gU9jwLlQI=;
        b=TMIk3eDVaLB9sMzeAakapWRQNemW7lD/NsYIvvUIlolSwJBi0CtkAZR/fh7UgLgHuF
         3/xOEa/D3Ha3i730KIls7xyTwKqhXcpksxAxZVmBpzoX+P/LCquiBOkcAlhj7n5glqUn
         e/9Xem8Yfn39fsCXSdSbLnIiFLjZaxSd6l0zuoDFW9otsdIATNdXQlHFLTpeXoZ79bXg
         wi/DKiseHcZpxoriX9aD3NRuSoRBnESTLGohdWHlrRu5+bUste9+EWRRfIXumEIJokm5
         5H0MwoOU/+rsJyoibsERX3Rcx7vlDfJG67vnZpHu/NFdLW1XrmhinBHHDoCHFGLSndnn
         39Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWHxGsnp1kHk80RclzRx6eIq87sWeJHoQVr1ClpekcpVZkmskW2F7OHsPbhYR3HhU/YTWI=@other.debian.org
X-Gm-Message-State: AOJu0YxvVyhGg9jjZJx7/iiPg7JzMUJibfdS5qZoizZsurVTJUfpOY2H
	DOnLxENRcMQMcLTuYaW92xbO6QMe6WEn6Rs4kyn2u/nEEWE9bPAbX0Aey6Eaq1P6AsXyY56sBp1
	dz/F0OV0anSyV5ivwbmYWVsD94DzSTMg=
X-Gm-Gg: AY/fxX6wnifvK5LUkrXMGcRoZkoDxpPGicE+APrF9pRtIdso+kYI8oKZLr/HiFHkhPU
	wAphwXY+vmdkYv1Fq2sqhBEhTQPcm6OTx++BpIemIZsqVaJfX9AknaLdPmzZUIirsFZu2CpWsTn
	OjCHKSo4iRmgnUUBSZua8ddoS6JUEMSezu7St7AGTkp4JAOSCQ1JUUPYTaxjzWXoK9QerOXpiVh
	ZxKZf9j3sPNcObYdnA1nSUJH+bXpXt5s/XHb5rjrASMQFpzb0fVrJFLVARuxd6s2vxtk14J47in
	T4ceyzU=
X-Google-Smtp-Source: AGHT+IHWmp4l+iwvvk4UGfOw4WyIVuDTX+WygPNaY3MwlLjW0z28sFuGsm38Zc7fjoo+CRsLN7xb1TW05w1c4WM+paQ=
X-Received: by 2002:a05:6214:5789:b0:880:3e92:3d33 with SMTP id
 6a1803df08f44-88d8369e698mr6123316d6.34.1766079357608; Thu, 18 Dec 2025
 09:35:57 -0800 (PST)
MIME-Version: 1.0
References: <5b023828-b03d-4351-b6f0-e13d0df8c446@wdc.com>
In-Reply-To: <5b023828-b03d-4351-b6f0-e13d0df8c446@wdc.com>
From: Justin Tee <justintee8345@gmail.com>
Date: Thu, 18 Dec 2025 09:34:45 -0800
X-Gm-Features: AQt7F2oCL92KL5RlafjzhPSPhxdJJT7DMmF2OqVJY7G1K2GtyDi2MGUAHicBT6Q
Message-ID: <CABPRKS-2zsAEjhsJX8aPjzud9LeOTCsF8WN=amSKpBzxxzJ-iQ@mail.gmail.com>
Subject: Re: blktests failures with v6.18 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OB0nH58R4QC.A.b38I.D_DRpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3480
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CABPRKS-2zsAEjhsJX8aPjzud9LeOTCsF8WN=amSKpBzxxzJ-iQ@mail.gmail.com
Resent-Date: Thu, 18 Dec 2025 17:54:11 +0000 (UTC)

Hi Shinichiro,

> List of failures
> ================
> #2: nvme/041 (fc transport)
>
>      The test case nvme/041 fails for fc transport. Refer to the report for the
>      v6.12 kernel [3]. Daniel posted the fix patch series [4].
>
>      [3] https://lore.kernel.org/linux-nvme/6crydkodszx5vq4ieox3jjpwkxtu7mhbohypy24awlo5w7f4k6@to3dcng24rd4/
>      [4] https://lore.kernel.org/linux-nvme/20250829-nvme-fc-sync-v3-0-d69c87e63aee@kernel.org/

This has been fixed in 6.19
https://lore.kernel.org/linux-nvme/20251117184343.97605-1-justintee8345@gmail.com/

commit 13989207ee29 (tag: nvme-6.19-2025-12-04) nvme-fabrics: add
ENOKEY to no retry criteria for authentication failures

Regards,
Justin

