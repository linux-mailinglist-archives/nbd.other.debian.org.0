Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181D9A26FE
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2024 17:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4829020616; Thu, 17 Oct 2024 15:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 15:39:10 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 04E052059E
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2024 15:22:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id klmSPG3lBWdb for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2024 15:22:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pg1-x52e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 274A2205B5
	for <nbd@other.debian.org>; Thu, 17 Oct 2024 15:22:28 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea8de14848so827921a12.2
        for <nbd@other.debian.org>; Thu, 17 Oct 2024 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729178545; x=1729783345; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSoKGGiRCnZ9piV//RZWaZZil92WuLO/DhXTXz1F4CQ=;
        b=oOScfAy+gWfzZ4ZBVa8JXjUn7/+hdjW92y+/QgG4GGnRq90PG7z2zZDsXYTg6WHaCu
         LNi1H6sakxuIR0R/8/c3NI3GgazjoNo0Bb444XHC60Xmeg1nvqzj2lo8JHSIK2+nM5M0
         4eDAoDvJ7Iwnb7c4ChijagrI/mW9nHk7WxhVyQqO3s547Sk9xMNE1KuHn5iZIMYSUHs1
         0WJOQtY+kt6RY/6dz3VXC3QvzEtUq789CDa8f8XU+jeoc9sh5y3+QuK7AupCZ4wSyj1t
         hlLS6nLZmao8uC4vj8kWnYog7+ZF/VL7ZwQVl5gU0nG8pece4egQ9jCcZgVv2K8zY67N
         Auaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178545; x=1729783345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSoKGGiRCnZ9piV//RZWaZZil92WuLO/DhXTXz1F4CQ=;
        b=O9WRqx8xeua1eL3ObbrcwmRWJjM9hHw77aEOCiSfaxEn9P7W0WN7Yk6FRTY9WGI8Jf
         rb1wFcW/7t3KNHImQYvMfSEyYDzCMrxaT9MqvssNresH7StaTMGrwD70ASjUzrzra/Xp
         xDS/j9OnJ8DtfveqdXQczhe0SzU3ZQoeltcGg3NZdSDGrXgNlfHhzmIby9ahA8ew46zj
         1C8o95GnbeRN9gfJ8UGz285T4qxjwBJM14Xh1I57qJ6gxYVBLorlkrGQ+VDpkgdBOrE1
         3I2Uhhkcciua1vcOp8cSqzk9R4iqbASQGP5fM3V7U/W9B0jbjE7beg0ZGFU610mrcmKl
         b0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ09UhN3N3bSf6Uibtjuzi7eW8K5qt6p12d3yX8YCQVR3rgUycspdEQwU7AQGwrhIr8eo=@other.debian.org
X-Gm-Message-State: AOJu0Yy3Xf3GqPKq4HtHBbaIDESjb5rUHrEzJouz64uMc5qY6Zi+soDj
	9PNPQ3znKDFYlSTIJnLg2mr5RmFRsxBESpX7/46XFuEjtR/5DKji4T9cZOE9Ouc=
X-Google-Smtp-Source: AGHT+IENU8Fr8yFzAl4iBhNeQFbxQre3LkDc6Ik49pVYvphrxavalgR2L35/luMRfY5ekKuaIxmvrQ==
X-Received: by 2002:a05:6a21:1789:b0:1c4:9f31:ac9e with SMTP id adf61e73a8af0-1d8bcfc21f5mr31655417637.42.1729178545042;
        Thu, 17 Oct 2024 08:22:25 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c707839sm5064130a12.69.2024.10.17.08.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 08:22:24 -0700 (PDT)
Message-ID: <140c4437-fea2-482b-a43f-4ffe6c35e3d2@kernel.dk>
Date: Thu, 17 Oct 2024 09:22:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: fix partial sending
To: Bart Van Assche <bvanassche@acm.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org
Cc: josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
 vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
 Kevin Wolf <kwolf@redhat.com>
References: <20241017113614.2964389-1-ming.lei@redhat.com>
 <354b464e-4ae0-460b-b6d1-8ae208345bfa@acm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <354b464e-4ae0-460b-b6d1-8ae208345bfa@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XfBNLvTb44L.A._odM.e-SEnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3174
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/140c4437-fea2-482b-a43f-4ffe6c35e3d2@kernel.dk
Resent-Date: Thu, 17 Oct 2024 15:39:10 +0000 (UTC)

On 10/17/24 9:13 AM, Bart Van Assche wrote:
> On 10/17/24 4:36 AM, Ming Lei wrote:
>> +static blk_status_t nbd_send_pending_cmd(struct nbd_device *nbd,
>> +        struct nbd_cmd *cmd)
>> +{
>> +    struct request *req = blk_mq_rq_from_pdu(cmd);
>> +    unsigned long deadline = READ_ONCE(req->deadline);
>> +    unsigned int wait_ms = 2;
>> +    blk_status_t res;
>> +
>> +    WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
>> +
>> +    while (true) {
>> +        res = nbd_send_cmd(nbd, cmd, cmd->index);
>> +        if (res != BLK_STS_RESOURCE)
>> +            return res;
>> +        if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline)
>> +            break;
>> +        msleep(wait_ms);
>> +        wait_ms *= 2;
>> +    }
> 
> I think that there are better solutions to wait until more data
> can be sent, e.g. by using the kernel equivalent of the C library
> function select().

It's vfs_poll() - but I don't think that'd be worth it here, the nbd
driver sets BLK_MQ_F_BLOCKING anyway. Using a poll trigger for this
would be a lot more complicated, and need quite a bit of support code.

-- 
Jens Axboe

