Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC2A25EA4
	for <lists+nbd@lfdr.de>; Mon,  3 Feb 2025 16:27:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B986C2072F; Mon,  3 Feb 2025 15:27:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  3 15:27:24 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D705420705
	for <lists-other-nbd@bendel.debian.org>; Mon,  3 Feb 2025 15:12:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HiKLmZ9Me8HK for <lists-other-nbd@bendel.debian.org>;
	Mon,  3 Feb 2025 15:12:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x134.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B2E5C206F4
	for <nbd@other.debian.org>; Mon,  3 Feb 2025 15:12:09 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ce7c4115e8so17567105ab.1
        for <nbd@other.debian.org>; Mon, 03 Feb 2025 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738595526; x=1739200326; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRfpPZzgAZa6Zak9GDas5XD80wl2C6NIA/57szE4cSk=;
        b=Lvh/i5ktL826YiJlGdv/dZs+D69sMBuvJ8KoIl5eVTPGXKAtMLIW0XThflInhZ2rTT
         HZIfMHipygvphzMCio+OWIqJhyD4i79vhvEm3LAhNnrsYk8M9ljZzrI0ZpvwbSYEl/W/
         AnlyElgmgKLy4zuw4EN2Yv7VPKq31wurxB65VEwZ8VLmMDuqYRVNfnmScEG2tNwGRNbc
         nnHwlpMtXijfpQuKrFuxtDNphVatF0Y6KZXT1XTtb40RaWXmqdAzOLyvLqndY7bmpcs3
         7Lg6ae4+aoqOcgLg+47fly7Sd+jVjDuJO+U1lyxKIYDx2aYnRqZIzEadROGO4f//brlC
         NPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595526; x=1739200326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRfpPZzgAZa6Zak9GDas5XD80wl2C6NIA/57szE4cSk=;
        b=lBANSh+RvBIQ+E3kNtXCd7HnpCbyejeJ3PJvITwBOTxpEu4i28wLzzgQJgz3jbvpkJ
         kd96W9jmPZbQu6GwOO/tiQXLS5RDmhR8B/0mEK+Plhwi+4JENceB+0WL+v7GA6zjBMWo
         /tfMzp+4lQOz+utXndq0zip7NRU+UKKP47XBZodTV+RG11wu0CGIs5bsbWTWqFs3YoGS
         ewrrNLNxLSs2If0V7JJo5E1s8dDrPe2B3h4eqdvpJQ3ldAunEkqpssa6opogJhT+ZzM2
         67oRffr1lsypjnwFF6IT52yCpZRUhesHafoFHpPsm76HSTPXhhsFR6nLiV/zXGW83Vs0
         9YNA==
X-Forwarded-Encrypted: i=1; AJvYcCWPuGoC8lSchUfMsyNYAOfzOSsKiw5+HiwmuAj2ty8InusV498pZx7GUpFyPtyNzAKKaNw=@other.debian.org
X-Gm-Message-State: AOJu0YwlVhAYLu/KNrW8hcpUSkXufNTCwX4lzM0dBR5SW74E2Nbr6cou
	A3lcPxD5DLjFeCHeCOywdw9qfZyF6pOHuelRZJO04XXRjWHrTzV0O9xrCJdGW9g=
X-Gm-Gg: ASbGncvDQLc4O2obA/VJx/L9A9zqsjSdI/6gyfHKkMgNt6SlO/H2s2QjAkvpPqWx45m
	w2GjxQ0C9enllBG72jEMzVKwanIVmmOfdM/PfJR9M7ri++UHwT65MGvC51Bm3dDORaMoM8+qbh2
	ikYk9bLJYV+OEnWm6MNQ35rCssi1RlrXF+PmqM42rPBA3bIqOD5pEa0LR8x1fnctHO93gyeBLma
	qm8c5iyjKEr1uNmQap9bwQW1bxiROAP12D8EcGHImQqAi3YQhKgSDoCmnIfSTHoEMZsYYjZH8v4
	iVUdlM7zMZg=
X-Google-Smtp-Source: AGHT+IExPksUoM3E6ty6LrIuS+bUTXtJbAwi3WKcho/2VPhbuSKK1HIuLb1aeN5jPmbZBIOOLKzxHw==
X-Received: by 2002:a05:6e02:2688:b0:3cf:b2ca:39b7 with SMTP id e9e14a558f8ab-3d008e71836mr145248235ab.3.1738595526174;
        Mon, 03 Feb 2025 07:12:06 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d01c433734sm16125455ab.14.2025.02.03.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:12:05 -0800 (PST)
Message-ID: <262032e2-a248-40aa-b5bd-deccc6c405ca@kernel.dk>
Date: Mon, 3 Feb 2025 08:12:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: force noio scope in blk_mq_freeze_queue
To: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@lst.de>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
References: <20250131120352.1315351-1-hch@lst.de>
 <20250131120352.1315351-2-hch@lst.de>
 <2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OycZirda3jN.A.3hHP.cBOonB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3366
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/262032e2-a248-40aa-b5bd-deccc6c405ca@kernel.dk
Resent-Date: Mon,  3 Feb 2025 15:27:24 +0000 (UTC)

On 2/3/25 8:09 AM, Guenter Roeck wrote:
> On Fri, Jan 31, 2025 at 01:03:47PM +0100, Christoph Hellwig wrote:
>> When block drivers or the core block code perform allocations with a
>> frozen queue, this could try to recurse into the block device to
>> reclaim memory and deadlock.  Thus all allocations done by a process
>> that froze a queue need to be done without __GFP_IO and __GFP_FS.
>> Instead of tying to track all of them down, force a noio scope as
>> part of freezing the queue.
>>
>> Note that nvme is a bit of a mess here due to the non-owner freezes,
>> and they will be addressed separately.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> All sparc64 builds fail with this patch in the tree.

Yep, Stephen reported the same yesterday. The patch is queued up,
will most likely just send it out separately.

-- 
Jens Axboe

