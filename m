Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62E7F1A19
	for <lists+nbd@lfdr.de>; Mon, 20 Nov 2023 18:33:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8AD2120608; Mon, 20 Nov 2023 17:33:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 20 17:33:28 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53BDC20592
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Nov 2023 17:17:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id U-Yp5RhN7i5o for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Nov 2023 17:17:01 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd33.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 948A02049E
	for <nbd@other.debian.org>; Mon, 20 Nov 2023 17:17:01 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7aff7bf7dafso31257139f.0
        for <nbd@other.debian.org>; Mon, 20 Nov 2023 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700500618; x=1701105418; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB7WfUEEaC1OvWTSK9npq8Mo0A16SnQAjvLM/HQZZuI=;
        b=sJbwqyIpUWJe0CulEbCxAniNu0FkPiBs/35iMxLtBrPT8WHVYA1yrSRCCZO3486Yex
         9xe6D96h7N1XfSANxihef6Cz1bGN5tb1GC90Hth083ih3bKx/MiNIy/xKODRpJbpjCJz
         Fk1+sq5KD0AkLyX7ztutkHck7nG45yotz7I555YBYVAXcD7kf0IwTRy0ofR1fU/7TpyL
         akhcABALoL7kKvNc9bCe51DiTrjuErw6L0dw9hOqaKQWRXc4pALFbOHB+1u9XEYtH2Ea
         kaSTwXSbIraEuCdp2nZZEPaEfBHOJjikSLcNNH764LvUBCub+JboA/ZNRjXYfs4+m5kc
         W8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500618; x=1701105418;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB7WfUEEaC1OvWTSK9npq8Mo0A16SnQAjvLM/HQZZuI=;
        b=RY7YTNuxsGbLOMEskUiWSrAfCXwOs8QRoFHyWLyiAl/3y41BRsuhebOaQW15qCWgZh
         PoKd8GzmHEYkwI0Gd+9ZQHiKkD+z0PsBdohidVJR/M4Bi3aaPm1do0eK3y93YgvEQj6E
         agtey9tqeHPMmpUXBghtHLBCJ31pRp8hHrOkkBqZ9WMYsgS/hMZbhgciLqPVo3sS7Q+h
         ATgEm1HelEz1MKK49KZ7XPP7WSXvUaucBFrNP2mgKDX5PSGHIrVjr9QDBpmNLn1Kz4UM
         HRqJb6FYGtCGsNThvbldEK8bksoY91XpQXvU57a/39TRXq1/wfVLAzlAlTt0p1sk+9L4
         gTDQ==
X-Gm-Message-State: AOJu0YyXWlqOj3izDFBgXLdDouNLbUIaBISkgERMbkOo6W4I0iZgpysh
	fIr28wSpelRil71BN0oqYWQ4dQ==
X-Google-Smtp-Source: AGHT+IEIoY7JzwmmB4jXQdtkfpQOU8uINar07von849M9jzHSJ+h0OJXJMILhL1W2qbS/ovZ+3bm5g==
X-Received: by 2002:a6b:fc0b:0:b0:7b0:7a86:2952 with SMTP id r11-20020a6bfc0b000000b007b07a862952mr7278834ioh.1.1700500618197;
        Mon, 20 Nov 2023 09:16:58 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ds21-20020a056638285500b004645a5d3b13sm2110468jab.19.2023.11.20.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:16:57 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, linan666@huaweicloud.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, linan122@huawei.com, yukuai3@huawei.com, 
 yi.zhang@huawei.com, houtao1@huawei.com, yangerkun@huawei.com
In-Reply-To: <20231116162316.1740402-1-linan666@huaweicloud.com>
References: <20231116162316.1740402-1-linan666@huaweicloud.com>
Subject: Re: [PATCH 0/3] fix null-ptr-deref in nbd_open()
Message-Id: <170050061729.96172.17600082878837866184.b4-ty@kernel.dk>
Date: Mon, 20 Nov 2023 10:16:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-26615
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9Dt3Y6xWUNN.A._dB.oh5WlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2676
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170050061729.96172.17600082878837866184.b4-ty@kernel.dk
Resent-Date: Mon, 20 Nov 2023 17:33:28 +0000 (UTC)


On Fri, 17 Nov 2023 00:23:13 +0800, linan666@huaweicloud.com wrote:
> Li Nan (3):
>   nbd: fold nbd config initialization into nbd_alloc_config()
>   nbd: factor out a helper to get nbd_config without holding
>     'config_lock'
>   nbd: fix null-ptr-dereference while accessing 'nbd->config'
> 
> drivers/block/nbd.c | 82 +++++++++++++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 29 deletions(-)
> 
> [...]

Applied, thanks!

[1/3] nbd: fold nbd config initialization into nbd_alloc_config()
      commit: 1b59860540a4018e8071dc18d4893ec389506b7d
[2/3] nbd: factor out a helper to get nbd_config without holding 'config_lock'
      commit: 3123ac77923341774ca3ad1196ad20bb0732bf70
[3/3] nbd: fix null-ptr-dereference while accessing 'nbd->config'
      commit: c2da049f419417808466c529999170f5c3ef7d3d

Best regards,
-- 
Jens Axboe



