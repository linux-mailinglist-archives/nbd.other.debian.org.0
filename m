Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F55A08DA5
	for <lists+nbd@lfdr.de>; Fri, 10 Jan 2025 11:15:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 138F4205DD; Fri, 10 Jan 2025 10:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 10 10:15:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E4AEC2057B
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jan 2025 09:58:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.838 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0LdwcapFHi_k for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jan 2025 09:57:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BFB372055B
	for <nbd@other.debian.org>; Fri, 10 Jan 2025 09:57:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10E31A41C38;
	Fri, 10 Jan 2025 09:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE57C4CED6;
	Fri, 10 Jan 2025 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736503072;
	bh=Ahu3Dj96KxIjB1xjdFeJU1rYT88XOcVzEVQ7DyN66M8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNFYg8qjo580eFZxxDoYZpxhYQGkf0D87WqqbLMa5KZ13hqmud4O3xBZb50SKG4ec
	 gDh3vn734bXAldYZFUP3PUBXTMPWHs7X9oDJp1PKnw9SJX8J3gSDYlRRntLbGUQBhM
	 4ZTf9aQW1+ql/1pDuuzP3ZhfU11nDXoeAJxewVFwrGXq/vaTS08CZ6dnFBm/g5gLxM
	 aD0+wO+1sbAx8Z6cKTkHriQfBH+WqXzPY1w1nRNPiZnBOwiJbpKLjnB3ZkGx0yfghc
	 sGj4kRcDO5VHKtBxxWVoYpb63rwtJJzMlkr/4Ulz8CzQ8AJNae9MioAuBGr4Qx4U/H
	 hu72t/BZ5t8gw==
Message-ID: <d7db7620-1f2e-4216-8929-2cfd4d847447@kernel.org>
Date: Fri, 10 Jan 2025 18:57:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] block: add a store_limit operations for sysfs
 entries
To: John Garry <john.g.garry@oracle.com>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20250110054726.1499538-1-hch@lst.de>
 <20250110054726.1499538-6-hch@lst.de>
 <79d85a4e-57c3-454e-a65b-d2a3764eaf0c@oracle.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <79d85a4e-57c3-454e-a65b-d2a3764eaf0c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zvyQwWdeUT.A.0h7G.tMPgnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3346
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d7db7620-1f2e-4216-8929-2cfd4d847447@kernel.org
Resent-Date: Fri, 10 Jan 2025 10:15:10 +0000 (UTC)

On 2025/01/10 18:56, John Garry wrote:
> On 10/01/2025 05:47, Christoph Hellwig wrote:
>> -static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
>> -					       const char *page, size_t count)
>> +static int queue_iostats_passthrough_store(struct gendisk *disk,
>> +		const char *page, size_t count, struct queue_limits *lim)
>>   {
>> -	struct queue_limits lim;
>>   	unsigned long ios;
>>   	ssize_t ret;
>>   
>> @@ -284,18 +269,13 @@ static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	lim = queue_limits_start_update(disk->queue);
>>   	if (ios)
>> -		lim.flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
>> +		lim->flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
>>   	else
>> -		lim.flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
>> -
>> -	ret = queue_limits_commit_update(disk->queue, &lim);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return count;
>> +		lim->flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
>> +	return 0;
>>   }
> 
> BTW, this function seems to duplicate queue_feature_store(), no?
> 
> I mean, why not:
> 
> static int queue_iostats_passthrough_store(struct gendisk *disk,
> const char *page, size_t count, struct queue_limits *lim)
> {
> 	return queue_feature_store(disk, page, count, lim,
> 		BLK_FLAG_IOSTATS_PASSTHROUGH);
> }
> 
> I think that there is even a macro for this.

Another cleanup to add to the pile I guess :)

-- 
Damien Le Moal
Western Digital Research

