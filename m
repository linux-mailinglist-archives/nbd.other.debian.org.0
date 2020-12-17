Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C92DD35A
	for <lists+nbd@lfdr.de>; Thu, 17 Dec 2020 15:57:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B7ADE2094D; Thu, 17 Dec 2020 14:57:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 17 14:57:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 194E4207D1
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Dec 2020 14:40:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id u7xXL6Bv_6ME for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Dec 2020 14:40:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 76CDA2058C
	for <nbd@other.debian.org>; Thu, 17 Dec 2020 14:40:04 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id bd6so13341333qvb.9
        for <nbd@other.debian.org>; Thu, 17 Dec 2020 06:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ogKrrKV+TtPAoHoe1fNFHNXZOViO5iz6ZfC2TYW45N8=;
        b=Pl7wuENL1WXAOmI3oAr7e3G0ftZOy0UJnMXLzfBoNOITEZzYSlo7aERwxA/EeUKoMz
         ti6yCuHQjAwzdyfBChT6twoLznkaOBtJc8ujEeQcajovGNu7WTg8lAIy9Z78uqz2NNxY
         OiOV/xXpG8DPNetyLNzAEWR3RTfD/RPacp9D1TJ+Wn8NuM2vyMsMQ2oa692slXzuIGmy
         nzUIXg6Tg/LUzkwjvQHX8mIsTJ473mj4KnDzrL/IYCXQoGKlVsJO/4tdICs6pjj1IwJz
         r1qAs/UQDJWlepedS+oOkGCUKRrD34J/9oce1WJo+hnrsPPaoRbhlenp0mhm1F6CV4H0
         68BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ogKrrKV+TtPAoHoe1fNFHNXZOViO5iz6ZfC2TYW45N8=;
        b=BdoaCtl11Goeyt06aM4bREFr3QRLBOrbb5Rip+KTn5M0DlKqupFGMAWoaFQ3q3KBQk
         jZ/urxrDbdjCstcHNbxARHY66tqR2DFGNh1DfT+1PQSW15kuZfWSWi7ANCwyc9bjOXMB
         Du4LIdnyDtXbKMyaCq5tC2foWQAQeS/zcsEDEgJhXZYKwWbVSl82/LxxunQpRgy3i7Ec
         1ja6fEnAg0Wt8yEN5NlX/RWPzbk7CBuC3f9espRDTOV6byuyv4yJu43WARbCle9lj8ri
         t9PoMqy5o1MWLFZfqL10f+jRq0LtK5+4PclZDYYKS4ODiRIlZVRTSsXtYBdkZRwbgd6A
         veaA==
X-Gm-Message-State: AOAM530RDvzRvbcehetnQXJgj5I2TLkl3Ml4ctW9rzdngi1AjCu1x/WW
	dzsC4Xi1hmViLA0PldzLbPht2A==
X-Google-Smtp-Source: ABdhPJyhCQrkFX8vgTpp80PgQQn0FKyq4tiJRCeZN0aCSqHYvGuPdcnGrVYPnsRFStx29qWurmvMgg==
X-Received: by 2002:a0c:fd89:: with SMTP id p9mr22656398qvr.8.1608216001461;
        Thu, 17 Dec 2020 06:40:01 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id c28sm3248644qtv.2.2020.12.17.06.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 06:40:00 -0800 (PST)
Subject: Re: [PATCH] nbd: Respect max_part for all partition scans
To: Josh Triplett <josh@joshtriplett.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <33c35aa8-b698-7141-6adb-ac0b76edf758@toxicpanda.com>
Date: Thu, 17 Dec 2020 09:39:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GKVf1_9p8HP.A.LTE.EH32fB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1102
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/33c35aa8-b698-7141-6adb-ac0b76edf758@toxicpanda.com
Resent-Date: Thu, 17 Dec 2020 14:57:08 +0000 (UTC)

On 12/17/20 3:58 AM, Josh Triplett wrote:
> The creation path of the NBD device respects max_part and only scans for
> partitions if max_part is not 0. However, some other code paths ignore
> max_part, and unconditionally scan for partitions. Add a check for
> max_part on each partition scan.
> 
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

