Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD8183299
	for <lists+nbd@lfdr.de>; Thu, 12 Mar 2020 15:15:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CBB320317; Thu, 12 Mar 2020 14:15:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 12 14:15:12 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3CF72023B
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Mar 2020 13:59:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jgmThxUWsKq5 for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Mar 2020 13:59:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd43.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 825AB20340
	for <nbd@other.debian.org>; Thu, 12 Mar 2020 13:59:06 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id t26so5758396ios.11
        for <nbd@other.debian.org>; Thu, 12 Mar 2020 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zTlRjOseOyMl3jA93cw2svqgh39qVO6h8t5eEoRUrVo=;
        b=lYsAIgpbcxx8SyvblMkx/gqzdjPUpxHVZp0Dozn1TdX7jJ8RQPhY2EwwwEdBEyHa8d
         Y2gf31DfsSkF7s3R223GoIa2un+DhsqKFjRvsa/WQ+9TOrg5E6+addic6Cun63qFANKl
         iWoAtz9SVjo/ElFiLWNu2BBeLEjBqFxD2wKjXiVJNM6OSmg8z4YyFtvwLih298dgQ9J5
         hMEtwF85V61rzlO/ek+yM/ca//+W7WHyMEFYm75krEDSKIdSG9WUYFLZjSX1m1vP6Lem
         h9pom7Dm0Zpc99cwOv6MnGhQqjfOgqal+zocU2kX70zR+3lY5APB5+mrD77vj8pCzXQm
         MQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zTlRjOseOyMl3jA93cw2svqgh39qVO6h8t5eEoRUrVo=;
        b=FTd/gq0yP8VrW8DP89tAQ1KEITGuXkPyCjNpPmtpleuJCUIbraQ/4Wad16aa5SXnp5
         FPHu2fHUC4gQgkUl7WCu6qQpINL7yow7LdU8kO9x+SOMhcKPZw6BP4VzJdn7faQz9dan
         i9sdgrahUCWqMxAUTqkTlcFOo4RL/gG4bl/ujs7uMeoDBUcgCrmrESAZf9w5AbI+08DX
         wRbm99/VWUwXxfwNDSmKs1uYAC9o7OfDj6E1KuhgqfR6ijYg/iXMYAerGberaeNHekZx
         6qydjQhU0O71awQaIIHeSNPErDHUoBu/jPkqOlddBJSw20IsCBu5Zk9/QM3dg8PzGhqk
         5JEA==
X-Gm-Message-State: ANhLgQ3hkFtKky9Bpp+pqOJT0YNcc77SSSDnoIbspgfBQlcNBCs4NcxD
	uRlK4Hr1ExS5yekwRVesHYMJxQ==
X-Google-Smtp-Source: ADFU+vtPZYlapRmWvw2pq53TpFm31JI0b2TqwVD7oq2luQRkfS8WUZ+EDaoteFpLJanNoCHbIZDoLg==
X-Received: by 2002:a5d:8cd3:: with SMTP id k19mr8072733iot.123.1584021543117;
        Thu, 12 Mar 2020 06:59:03 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id o76sm3746593ili.18.2020.03.12.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 06:59:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] nbd: requeue request if only one connection is
 configured
To: Hou Pu <houpu.main@gmail.com>, josef@toxicpanda.com, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b407f0d1-f07c-4d6b-9657-bb296557ff50@kernel.dk>
Date: Thu, 12 Mar 2020 07:59:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228064030.16780-1-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6Q0hdM6DkwG.A.AzD.wPkaeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/851
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b407f0d1-f07c-4d6b-9657-bb296557ff50@kernel.dk
Resent-Date: Thu, 12 Mar 2020 14:15:12 +0000 (UTC)

On 2/27/20 11:40 PM, Hou Pu wrote:
> Hello,
> 
> NBD server could be upgraded if we have multiple connections.
> But if we have only one connection, after we take down NBD server,
> all inflight IO could finally timeout and return error. These
> patches fix this using current reconfiguration framework.
> 
> I noticed that Mike has following patchset
> 
> nbd: local daemon restart support
> https://lore.kernel.org/linux-block/5DD41C49.3080209@redhat.com/
> 
> It add another netlink interface (NBD_ATTR_SWAP_SOCKETS) and requeue
> request immediately after recongirure/swap socket. It do not need to
> wait for timeout to fire and requeue in timeout handler, which seems more
> like an improvement. Let fix this in current framework first.
> 
> Changes compared to v2:
> Fix comments in nbd_read_stat() to be aligned with the code change
> suggested by Mike Christie.

Applied for 5.7.

-- 
Jens Axboe

