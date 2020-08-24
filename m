Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 413BE24F4E5
	for <lists+nbd@lfdr.de>; Mon, 24 Aug 2020 10:42:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A0F320490; Mon, 24 Aug 2020 08:42:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 24 08:42:15 2020
Old-Return-Path: <sagigrim@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=CC_TOO_MANY,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 548792044D
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Aug 2020 08:26:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.965 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.048,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pmg80IJECCE9 for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Aug 2020 08:26:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f195.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4390720447
	for <nbd@other.debian.org>; Mon, 24 Aug 2020 08:26:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t11so3873112plr.5
        for <nbd@other.debian.org>; Mon, 24 Aug 2020 01:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=LbgeFwHvzEXl/ZlwRf09Stnw7omb1qm6PGfaK+VEywPqfGrVH+W3V5i3BaEgWTWC9h
         39NUhrBNgnjuc9+AVAc2qdCc36Z8qI+Hjdj0yU7Es7MIwtxm0ePEFWA00Q5Y9w2Cn8Av
         ERNMmvEVR8Fzu0oKoDkObj0JVar6TJ6g0be84NGHKVmQLna4zQoiGa40Bv3TLcg+LEkW
         XwZe50KJc1QHizWiIIg1V2l6Uf/bmWZ8J9r3cW+TfQHXAH1FHANJvA6wdAW6I5u6ZFo3
         hutIqm6yi2NX1Zhz18F3H/4mQR5xSMqt9OuClKZHwM6qWkSHSlMUYbq02VKcx/u35JQE
         Qo1Q==
X-Gm-Message-State: AOAM532hNMktOMsD1AyntGyslZtVpB1fvFO+rY8qI8OvjmdGgTz4Ks17
	noIJXO3ufmAlUKmiLk9QEhc=
X-Google-Smtp-Source: ABdhPJxW0Sb1W31ji1xD5/tXnfUfq/0hDyEu38/TERhsoxJVdj23q3MPeALuQr+JGwJy3gfWJGZhFA==
X-Received: by 2002:a17:902:748c:: with SMTP id h12mr3050709pll.316.1598257560600;
        Mon, 24 Aug 2020 01:26:00 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:cda6:bf68:c972:645d? ([2601:647:4802:9070:cda6:bf68:c972:645d])
        by smtp.gmail.com with ESMTPSA id j5sm10776991pfg.80.2020.08.24.01.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 01:26:00 -0700 (PDT)
Subject: Re: [PATCH 1/3] block: replace bd_set_size with bd_set_nr_sectors
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
 nbd@other.debian.org, Hannes Reinecke <hare@suse.de>
References: <20200823091043.2600261-1-hch@lst.de>
 <20200823091043.2600261-2-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <f31bb1a9-2f2c-2002-c7ce-29aa43feeafb@grimberg.me>
Date: Mon, 24 Aug 2020 01:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YlUj-XM6lPI.A.bEF.n13QfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/949
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f31bb1a9-2f2c-2002-c7ce-29aa43feeafb@grimberg.me
Resent-Date: Mon, 24 Aug 2020 08:42:15 +0000 (UTC)

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

